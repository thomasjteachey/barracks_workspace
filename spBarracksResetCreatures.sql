DELIMITER $$

CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksResetCreatures`()
BEGIN
    DECLARE v_old_foreign_key_checks INT DEFAULT @@FOREIGN_KEY_CHECKS;

    SET FOREIGN_KEY_CHECKS = 0;

    /* base TrinityCore copies */
    DROP TABLE IF EXISTS barracksworld.creature;
    CREATE TABLE barracksworld.creature LIKE trinityworld.creature;
    INSERT INTO barracksworld.creature SELECT * FROM trinityworld.creature;

    DROP TABLE IF EXISTS barracksworld.creature_addon;
    CREATE TABLE barracksworld.creature_addon LIKE trinityworld.creature_addon;
    INSERT INTO barracksworld.creature_addon SELECT * FROM trinityworld.creature_addon;

    DROP TABLE IF EXISTS barracksworld.creature_equip_template;
    CREATE TABLE barracksworld.creature_equip_template LIKE trinityworld.creature_equip_template;
    INSERT INTO barracksworld.creature_equip_template SELECT * FROM trinityworld.creature_equip_template;

    DROP TABLE IF EXISTS barracksworld.creature_loot_template;
    CREATE TABLE barracksworld.creature_loot_template LIKE trinityworld.creature_loot_template;
    INSERT INTO barracksworld.creature_loot_template SELECT * FROM trinityworld.creature_loot_template;

    DROP TABLE IF EXISTS barracksworld.creature_model_info;
    CREATE TABLE barracksworld.creature_model_info LIKE trinityworld.creature_model_info;
    INSERT INTO barracksworld.creature_model_info SELECT * FROM trinityworld.creature_model_info;

    DROP TABLE IF EXISTS barracksworld.creature_onkill_reputation;
    CREATE TABLE barracksworld.creature_onkill_reputation LIKE trinityworld.creature_onkill_reputation;
    INSERT INTO barracksworld.creature_onkill_reputation SELECT * FROM trinityworld.creature_onkill_reputation;

    DROP TABLE IF EXISTS barracksworld.creature_template;
    CREATE TABLE barracksworld.creature_template LIKE trinityworld.creature_template;
    INSERT INTO barracksworld.creature_template SELECT * FROM trinityworld.creature_template;

    DROP TABLE IF EXISTS barracksworld.creature_template_addon;
    CREATE TABLE barracksworld.creature_template_addon LIKE trinityworld.creature_template_addon;
    INSERT INTO barracksworld.creature_template_addon SELECT * FROM trinityworld.creature_template_addon;

    DROP TABLE IF EXISTS barracksworld.game_event_creature;
    CREATE TABLE barracksworld.game_event_creature LIKE trinityworld.game_event_creature;
    INSERT INTO barracksworld.game_event_creature SELECT * FROM trinityworld.game_event_creature;

    /* identify classic guids and entries for Azeroth (maps 0 and 1) */
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_guids;
    CREATE TEMPORARY TABLE tmp_classic_creature_guids
    SELECT DISTINCT guid
    FROM classicmangos.creature
    WHERE map IN (0, 1);

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_entries;
    CREATE TEMPORARY TABLE tmp_classic_creature_entries
    SELECT DISTINCT id AS entry
    FROM classicmangos.creature
    WHERE map IN (0, 1);

    /* overwrite Trinity data for the classic continents */
    DELETE FROM barracksworld.creature
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.creature
    SELECT c.*
    FROM classicmangos.creature c
    WHERE c.map IN (0, 1);

    DELETE FROM barracksworld.creature_addon
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.creature_addon
    SELECT ca.*
    FROM classicmangos.creature_addon ca
    INNER JOIN tmp_classic_creature_guids g ON g.guid = ca.guid;

    DELETE FROM barracksworld.game_event_creature
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.game_event_creature
    SELECT gec.*
    FROM classicmangos.game_event_creature gec
    INNER JOIN tmp_classic_creature_guids g ON g.guid = gec.guid;

    DELETE FROM barracksworld.creature_template
    WHERE entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_template
    SELECT ct.*
    FROM classicmangos.creature_template ct
    INNER JOIN tmp_classic_creature_entries e ON e.entry = ct.entry;

    DELETE FROM barracksworld.creature_template_addon
    WHERE entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_template_addon
    SELECT cta.*
    FROM classicmangos.creature_template_addon cta
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cta.entry;

    DELETE FROM barracksworld.creature_equip_template
    WHERE entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_equip_template
    SELECT cet.*
    FROM classicmangos.creature_equip_template cet
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cet.entry;

    DELETE FROM barracksworld.creature_loot_template
    WHERE Entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_loot_template
    SELECT clt.*
    FROM classicmangos.creature_loot_template clt
    INNER JOIN tmp_classic_creature_entries e ON e.entry = clt.Entry;

    DELETE FROM barracksworld.creature_model_info
    WHERE DisplayID IN (
        SELECT DISTINCT modelid1 FROM classicmangos.creature_template ct
        INNER JOIN tmp_classic_creature_entries e ON e.entry = ct.entry
    );

    INSERT INTO barracksworld.creature_model_info
    SELECT cmi.*
    FROM classicmangos.creature_model_info cmi
    WHERE cmi.modelid IN (
        SELECT DISTINCT modelid1 FROM classicmangos.creature_template ct
        INNER JOIN tmp_classic_creature_entries e ON e.entry = ct.entry
    );

    DELETE FROM barracksworld.creature_onkill_reputation
    WHERE creature_id IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_onkill_reputation
    SELECT cok.*
    FROM classicmangos.creature_onkill_reputation cok
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cok.creature_id;

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_guids;
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_entries;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;

