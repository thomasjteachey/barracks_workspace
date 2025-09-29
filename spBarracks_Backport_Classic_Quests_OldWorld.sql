CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracks_Backport_Classic_Quests_OldWorld`(
    IN p_verified_build INT  -- e.g., 12340 or 0 (used only on newly inserted quest_template stubs)
)
BEGIN
  DECLARE v_err INT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET v_err = 1;

  START TRANSACTION;

  /* ---------------------------------------------
     0) Scope: only affect things that actually
        spawn in TC on maps 0/1 (old world)
     --------------------------------------------- */
  DROP TEMPORARY TABLE IF EXISTS tmp_tc_old_cre_entries;
  CREATE TEMPORARY TABLE tmp_tc_old_cre_entries ENGINE=InnoDB AS
  SELECT DISTINCT c.id AS entry
  FROM barracksworld.creature c
  WHERE c.map IN (0,1);

  CREATE INDEX ix_tc_old_cre_entry ON tmp_tc_old_cre_entries(entry);

  DROP TEMPORARY TABLE IF EXISTS tmp_tc_old_go_entries;
  CREATE TEMPORARY TABLE tmp_tc_old_go_entries ENGINE=InnoDB AS
  SELECT DISTINCT g.id AS entry
  FROM barracksworld.gameobject g
  WHERE g.map IN (0,1);

  CREATE INDEX ix_tc_old_go_entry ON tmp_tc_old_go_entries(entry);

  /* ---------------------------------------------
     1) Quest IDs referenced by Classic in old world
     --------------------------------------------- */
  DROP TEMPORARY TABLE IF EXISTS tmp_classic_qids;
  CREATE TEMPORARY TABLE tmp_classic_qids ENGINE=InnoDB AS
  SELECT DISTINCT q.quest AS QuestId
  FROM (
      SELECT cqr.id, cqr.quest FROM cmangos.creature_questrelation cqr
      UNION ALL
      SELECT cir.id, cir.quest FROM cmangos.creature_involvedrelation cir
      UNION ALL
      SELECT gqr.id, gqr.quest FROM cmangos.gameobject_questrelation gqr
      UNION ALL
      SELECT gir.id, gir.quest FROM cmangos.gameobject_involvedrelation gir
  ) AS q
  LEFT JOIN tmp_tc_old_cre_entries  t1 ON t1.entry = q.id
  LEFT JOIN tmp_tc_old_go_entries   t2 ON t2.entry = q.id
  WHERE t1.entry IS NOT NULL OR t2.entry IS NOT NULL;

  CREATE INDEX ix_tmp_classic_qids ON tmp_classic_qids(QuestId);

  /* ---------------------------------------------
     2) Ensure quest_template rows exist (safe stub)
     --------------------------------------------- */
  INSERT IGNORE INTO barracksworld.quest_template (`Id`)
  SELECT QuestId FROM tmp_classic_qids;

  /* Optionally stamp VerifiedBuild on those we just inserted (no-op if column is nullable) */
  UPDATE barracksworld.quest_template qt
  JOIN tmp_classic_qids q ON q.QuestId = qt.Id
  SET qt.VerifiedBuild = p_verified_build;

  /* ---------------------------------------------
     3) CREATURE quest starters/enders → Classic
        (only for TC NPCs that spawn in maps 0/1)
     --------------------------------------------- */
  -- Starters (creature)
  DROP TEMPORARY TABLE IF EXISTS tmp_c_starter_classic;
  CREATE TEMPORARY TABLE tmp_c_starter_classic ENGINE=InnoDB AS
  SELECT cqr.id AS entry, cqr.quest
  FROM cmangos.creature_questrelation cqr
  JOIN tmp_tc_old_cre_entries t ON t.entry = cqr.id;

  CREATE INDEX ix_cst ON tmp_c_starter_classic(entry, quest);

  -- Remove TC old-world starters not in Classic
  DELETE cqs
  FROM barracksworld.creature_queststarter cqs
  JOIN tmp_tc_old_cre_entries t ON t.entry = cqs.id
  LEFT JOIN tmp_c_starter_classic s
         ON  s.entry = cqs.id AND s.quest = cqs.quest
  WHERE s.entry IS NULL;

  -- Insert missing Classic starters
  INSERT INTO barracksworld.creature_queststarter (`id`,`quest`)
  SELECT s.entry, s.quest
  FROM tmp_c_starter_classic s
  LEFT JOIN barracksworld.creature_queststarter cqs
         ON cqs.id = s.entry AND cqs.quest = s.quest
  WHERE cqs.id IS NULL;

  -- Enders (creature)
  DROP TEMPORARY TABLE IF EXISTS tmp_c_ender_classic;
  CREATE TEMPORARY TABLE tmp_c_ender_classic ENGINE=InnoDB AS
  SELECT cir.id AS entry, cir.quest
  FROM cmangos.creature_involvedrelation cir
  JOIN tmp_tc_old_cre_entries t ON t.entry = cir.id;

  CREATE INDEX ix_cen ON tmp_c_ender_classic(entry, quest);

  DELETE cqe
  FROM barracksworld.creature_questender cqe
  JOIN tmp_tc_old_cre_entries t ON t.entry = cqe.id
  LEFT JOIN tmp_c_ender_classic s
         ON  s.entry = cqe.id AND s.quest = cqe.quest
  WHERE s.entry IS NULL;

  INSERT INTO barracksworld.creature_questender (`id`,`quest`)
  SELECT s.entry, s.quest
  FROM tmp_c_ender_classic s
  LEFT JOIN barracksworld.creature_questender cqe
         ON cqe.id = s.entry AND cqe.quest = s.quest
  WHERE cqe.id IS NULL;

  /* ---------------------------------------------
     4) GAMEOBJECT quest starters/enders → Classic
        (only for TC GOs that spawn in maps 0/1)
     --------------------------------------------- */
  -- Starters (GO)
  DROP TEMPORARY TABLE IF EXISTS tmp_g_starter_classic;
  CREATE TEMPORARY TABLE tmp_g_starter_classic ENGINE=InnoDB AS
  SELECT gqr.id AS entry, gqr.quest
  FROM cmangos.gameobject_questrelation gqr
  JOIN tmp_tc_old_go_entries t ON t.entry = gqr.id;

  CREATE INDEX ix_gst ON tmp_g_starter_classic(entry, quest);

  DELETE gqs
  FROM barracksworld.gameobject_queststarter gqs
  JOIN tmp_tc_old_go_entries t ON t.entry = gqs.id
  LEFT JOIN tmp_g_starter_classic s
         ON  s.entry = gqs.id AND s.quest = gqs.quest
  WHERE s.entry IS NULL;

  INSERT INTO barracksworld.gameobject_queststarter (`id`,`quest`)
  SELECT s.entry, s.quest
  FROM tmp_g_starter_classic s
  LEFT JOIN barracksworld.gameobject_queststarter gqs
         ON gqs.id = s.entry AND gqs.quest = s.quest
  WHERE gqs.id IS NULL;

  -- Enders (GO)
  DROP TEMPORARY TABLE IF EXISTS tmp_g_ender_classic;
  CREATE TEMPORARY TABLE tmp_g_ender_classic ENGINE=InnoDB AS
  SELECT gir.id AS entry, gir.quest
  FROM cmangos.gameobject_involvedrelation gir
  JOIN tmp_tc_old_go_entries t ON t.entry = gir.id;

  CREATE INDEX ix_gen ON tmp_g_ender_classic(entry, quest);

  DELETE gqe
  FROM barracksworld.gameobject_questender gqe
  JOIN tmp_tc_old_go_entries t ON t.entry = gqe.id
  LEFT JOIN tmp_g_ender_classic s
         ON  s.entry = gqe.id AND s.quest = gqe.quest
  WHERE s.entry IS NULL;

  INSERT INTO barracksworld.gameobject_questender (`id`,`quest`)
  SELECT s.entry, s.quest
  FROM tmp_g_ender_classic s
  LEFT JOIN barracksworld.gameobject_questender gqe
         ON gqe.id = s.entry AND gqe.quest = s.quest
  WHERE gqe.id IS NULL;

  /* ---------------------------------------------
     5) Finish
     --------------------------------------------- */
  IF v_err = 1 THEN
    ROLLBACK;
    SELECT 'ERROR: quest backport aborted (rolled back).' AS msg;
  ELSE
    COMMIT;
    SELECT
      (SELECT COUNT(*) FROM barracksworld.quest_template)             AS tc_quest_template_rows,
      (SELECT COUNT(*) FROM barracksworld.creature_queststarter)      AS tc_creature_qstarters,
      (SELECT COUNT(*) FROM barracksworld.creature_questender)        AS tc_creature_qenders,
      (SELECT COUNT(*) FROM barracksworld.gameobject_queststarter)    AS tc_go_qstarters,
      (SELECT COUNT(*) FROM barracksworld.gameobject_questender)      AS tc_go_qenders;
  END IF;
END