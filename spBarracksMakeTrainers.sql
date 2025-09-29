CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksMakeTrainers`()
BEGIN
  DECLARE old_safe_updates INT DEFAULT 0;

  /* Roll back on any error and restore SQL_SAFE_UPDATES */
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET SQL_SAFE_UPDATES = old_safe_updates;
    SELECT 'ERROR: transaction rolled back' AS msg;
  END;

  START TRANSACTION;

  /* Keep updates flexible during maintenance */
  SET old_safe_updates = @@SQL_SAFE_UPDATES;
  SET SQL_SAFE_UPDATES = 0;

  /* Avoid truncation before MD5() */
  SET SESSION group_concat_max_len = 1024*1024;

  /* 0) Only operate on trainers mapped to creatures */
  DROP TEMPORARY TABLE IF EXISTS tmp_mapped_trainers;
  CREATE TEMPORARY TABLE tmp_mapped_trainers ENGINE=InnoDB AS
  SELECT DISTINCT cdt.TrainerId
  FROM barracksworld.creature_default_trainer cdt;

  /* 1) Build fingerprint (order-insensitive, requirement-aware) per trainer */
  DROP TEMPORARY TABLE IF EXISTS tmp_trainer_signatures;
  CREATE TEMPORARY TABLE tmp_trainer_signatures (
    TrainerId INT UNSIGNED NOT NULL PRIMARY KEY,
    Sig       BINARY(16)   NOT NULL
  ) ENGINE=InnoDB;

  INSERT INTO tmp_trainer_signatures (TrainerId, Sig)
  SELECT
    ts.TrainerId,
    UNHEX(MD5(
      GROUP_CONCAT(
        CONCAT_WS(':',
          ts.SpellId,
          ts.ReqLevel,
          ts.ReqSkillLine,
          ts.ReqSkillRank,
          ts.ReqAbility1,
          ts.ReqAbility2,
          ts.ReqAbility3,
          ts.MoneyCost
        )
        ORDER BY ts.SpellId, ts.ReqLevel, ts.ReqSkillLine, ts.ReqSkillRank,
                 ts.ReqAbility1, ts.ReqAbility2, ts.ReqAbility3, ts.MoneyCost
        SEPARATOR ';'
      )
    )) AS Sig
  FROM barracksworld.trainer_spell ts
  JOIN tmp_mapped_trainers mt ON mt.TrainerId = ts.TrainerId
  GROUP BY ts.TrainerId;

  /* 2) Unique signatures → choose representative trainer for each */
  DROP TEMPORARY TABLE IF EXISTS tmp_unique_sets;
  CREATE TEMPORARY TABLE tmp_unique_sets (
    CanonicalId  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sig          BINARY(16)   NOT NULL,
    RepTrainerId INT UNSIGNED NOT NULL,
    Type         TINYINT UNSIGNED NOT NULL,
    Requirement  INT UNSIGNED NOT NULL
  ) ENGINE=InnoDB;

  /* Start canon IDs high to avoid stock 1..126 */
  ALTER TABLE tmp_unique_sets AUTO_INCREMENT = 500000;

  INSERT INTO tmp_unique_sets (Sig, RepTrainerId, Type, Requirement)
  SELECT
    s.Sig,
    MIN(s.TrainerId)            AS RepTrainerId,
    COALESCE(MIN(tr.Type), 0)   AS Type,
    COALESCE(MIN(tr.Requirement), 0) AS Requirement
  FROM tmp_trainer_signatures s
  JOIN barracksworld.trainer tr ON tr.Id = s.TrainerId
  GROUP BY s.Sig;

  /* 3) Map OldTrainerId → CanonicalId */
  DROP TEMPORARY TABLE IF EXISTS tmp_old_to_new;
  CREATE TEMPORARY TABLE tmp_old_to_new (
    OldTrainerId INT UNSIGNED NOT NULL PRIMARY KEY,
    CanonicalId  INT UNSIGNED NOT NULL
  ) ENGINE=InnoDB;

  INSERT INTO tmp_old_to_new (OldTrainerId, CanonicalId)
  SELECT s.TrainerId, u.CanonicalId
  FROM tmp_trainer_signatures s
  JOIN tmp_unique_sets u ON u.Sig = s.Sig;

  /* 4) Create/update canonical trainer rows */
  INSERT INTO barracksworld.trainer (Id, Type, Requirement, Greeting, VerifiedBuild)
  SELECT
    u.CanonicalId,
    u.Type,
    u.Requirement,
    NULL,
    0
  FROM tmp_unique_sets u
  ON DUPLICATE KEY UPDATE
    Type         = VALUES(Type),
    Requirement  = VALUES(Requirement),
    Greeting     = VALUES(Greeting),
    VerifiedBuild= VALUES(VerifiedBuild);

  /* 5) Rebuild canonical trainer_spell from representative rows */
  DELETE ts
  FROM barracksworld.trainer_spell ts
  JOIN tmp_unique_sets u ON u.CanonicalId = ts.TrainerId;

  INSERT INTO barracksworld.trainer_spell
    (TrainerId, SpellId, MoneyCost, ReqSkillLine, ReqSkillRank,
     ReqAbility1, ReqAbility2, ReqAbility3, ReqLevel, VerifiedBuild)
  SELECT
    u.CanonicalId,
    rs.SpellId, rs.MoneyCost, rs.ReqSkillLine, rs.ReqSkillRank,
    rs.ReqAbility1, rs.ReqAbility2, rs.ReqAbility3,
    rs.ReqLevel,
    0
  FROM tmp_unique_sets u
  JOIN barracksworld.trainer_spell rs ON rs.TrainerId = u.RepTrainerId;

  /* 6) Repoint creatures to canonical trainers */
  UPDATE barracksworld.creature_default_trainer cdt
  JOIN tmp_old_to_new m ON m.OldTrainerId = cdt.TrainerId
  SET cdt.TrainerId = m.CanonicalId;

  /* 7) Remove unreferenced trainer_spell */
  DELETE ts
  FROM barracksworld.trainer_spell ts
  LEFT JOIN barracksworld.creature_default_trainer cdt
    ON cdt.TrainerId = ts.TrainerId
  WHERE cdt.TrainerId IS NULL;

  /* 8) Remove unreferenced trainer rows */
  DELETE tr
  FROM barracksworld.trainer tr
  LEFT JOIN barracksworld.creature_default_trainer cdt
    ON cdt.TrainerId = tr.Id
  WHERE cdt.TrainerId IS NULL;

  /* 9) Ensure TRAINER flag on all mapped creatures */
  UPDATE barracksworld.creature_template ct
  JOIN barracksworld.creature_default_trainer cdt
    ON cdt.CreatureId = ct.entry
  SET ct.npcflag = ct.npcflag | 0x20;

  COMMIT;

  /* Restore and return a tiny summary */
  SET SQL_SAFE_UPDATES = old_safe_updates;

  SELECT
    (SELECT COUNT(*) FROM barracksworld.trainer)                         AS trainer_rows,
    (SELECT COUNT(*) FROM barracksworld.trainer_spell)                   AS trainer_spell_rows,
    (SELECT COUNT(*) FROM barracksworld.creature_default_trainer)        AS mappings;

END