DELIMITER $$

CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksResetQuests`()
BEGIN
    DECLARE v_old_foreign_key_checks INT DEFAULT @@FOREIGN_KEY_CHECKS;

    SET FOREIGN_KEY_CHECKS = 0;

    /* base TrinityCore copies */
    DROP TABLE IF EXISTS barracksworld.quest_template;
    CREATE TABLE barracksworld.quest_template LIKE trinityworld.quest_template;
    INSERT INTO barracksworld.quest_template SELECT * FROM trinityworld.quest_template;

    DROP TABLE IF EXISTS barracksworld.quest_poi;
    CREATE TABLE barracksworld.quest_poi LIKE trinityworld.quest_poi;
    INSERT INTO barracksworld.quest_poi SELECT * FROM trinityworld.quest_poi;

    DROP TABLE IF EXISTS barracksworld.quest_poi_points;
    CREATE TABLE barracksworld.quest_poi_points LIKE trinityworld.quest_poi_points;
    INSERT INTO barracksworld.quest_poi_points SELECT * FROM trinityworld.quest_poi_points;

    /* classic quest identifiers */
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_quest_ids;
    CREATE TEMPORARY TABLE tmp_classic_quest_ids
    SELECT DISTINCT qt.ID AS questId
    FROM classicmangos.quest_template qt;

    /* overwrite Trinity data with classic quest data */
    DELETE FROM barracksworld.quest_template
    WHERE ID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_template
    SELECT qt.*
    FROM classicmangos.quest_template qt;

    DELETE FROM barracksworld.quest_poi
    WHERE QuestID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_poi
    SELECT qp.*
    FROM classicmangos.quest_poi qp
    INNER JOIN tmp_classic_quest_ids q ON q.questId = qp.QuestID;

    DELETE FROM barracksworld.quest_poi_points
    WHERE QuestID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_poi_points
    SELECT qpp.*
    FROM classicmangos.quest_poi_points qpp
    INNER JOIN tmp_classic_quest_ids q ON q.questId = qpp.QuestID;

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_quest_ids;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;

