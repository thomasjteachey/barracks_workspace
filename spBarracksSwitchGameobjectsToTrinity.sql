DELIMITER $$

DROP PROCEDURE IF EXISTS `spBarracksSwitchGameobjectsToTrinity`$$

CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksSwitchGameobjectsToTrinity`()
BEGIN
    DECLARE v_old_foreign_key_checks INT DEFAULT @@FOREIGN_KEY_CHECKS;

    SET FOREIGN_KEY_CHECKS = 0;

    /* Replace Barracks gameobject tables with TrinityCore data */
    DROP TABLE IF EXISTS barracksworld.gameobject;
    CREATE TABLE barracksworld.gameobject LIKE trinityworld.gameobject;
    INSERT INTO barracksworld.gameobject SELECT * FROM trinityworld.gameobject;

    DROP TABLE IF EXISTS barracksworld.gameobject_addon;
    CREATE TABLE barracksworld.gameobject_addon LIKE trinityworld.gameobject_addon;
    INSERT INTO barracksworld.gameobject_addon SELECT * FROM trinityworld.gameobject_addon;

    DROP TABLE IF EXISTS barracksworld.gameobject_loot_template;
    CREATE TABLE barracksworld.gameobject_loot_template LIKE trinityworld.gameobject_loot_template;
    INSERT INTO barracksworld.gameobject_loot_template SELECT * FROM trinityworld.gameobject_loot_template;

    DROP TABLE IF EXISTS barracksworld.gameobject_questender;
    CREATE TABLE barracksworld.gameobject_questender LIKE trinityworld.gameobject_questender;
    INSERT INTO barracksworld.gameobject_questender SELECT * FROM trinityworld.gameobject_questender;

    DROP TABLE IF EXISTS barracksworld.gameobject_questitem;
    CREATE TABLE barracksworld.gameobject_questitem LIKE trinityworld.gameobject_questitem;
    INSERT INTO barracksworld.gameobject_questitem SELECT * FROM trinityworld.gameobject_questitem;

    DROP TABLE IF EXISTS barracksworld.gameobject_queststarter;
    CREATE TABLE barracksworld.gameobject_queststarter LIKE trinityworld.gameobject_queststarter;
    INSERT INTO barracksworld.gameobject_queststarter SELECT * FROM trinityworld.gameobject_queststarter;

    DROP TABLE IF EXISTS barracksworld.gameobject_template;
    CREATE TABLE barracksworld.gameobject_template LIKE trinityworld.gameobject_template;
    INSERT INTO barracksworld.gameobject_template SELECT * FROM trinityworld.gameobject_template;

    DROP TABLE IF EXISTS barracksworld.gameobject_template_addon;
    CREATE TABLE barracksworld.gameobject_template_addon LIKE trinityworld.gameobject_template_addon;
    INSERT INTO barracksworld.gameobject_template_addon SELECT * FROM trinityworld.gameobject_template_addon;

    DROP TABLE IF EXISTS barracksworld.game_event_gameobject;
    CREATE TABLE barracksworld.game_event_gameobject LIKE trinityworld.game_event_gameobject;
    INSERT INTO barracksworld.game_event_gameobject SELECT * FROM trinityworld.game_event_gameobject;

    DROP TABLE IF EXISTS barracksworld.game_event_gameobject_quest;
    CREATE TABLE barracksworld.game_event_gameobject_quest LIKE trinityworld.game_event_gameobject_quest;
    INSERT INTO barracksworld.game_event_gameobject_quest SELECT * FROM trinityworld.game_event_gameobject_quest;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;
