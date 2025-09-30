DELIMITER $$

DROP PROCEDURE IF EXISTS `spBarracksResetGameobjects`$$

CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksResetGameobjects`()
BEGIN
    DECLARE v_old_foreign_key_checks INT DEFAULT @@FOREIGN_KEY_CHECKS;

    SET FOREIGN_KEY_CHECKS = 0;

    /* base TrinityCore copies */
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

    /* identify classic gameobject guids and entries for Azeroth (maps 0 and 1) */
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_go_guids;
    CREATE TEMPORARY TABLE tmp_classic_go_guids
    SELECT DISTINCT guid
    FROM classicmangos.gameobject
    WHERE map IN (0, 1);

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_go_entries;
    CREATE TEMPORARY TABLE tmp_classic_go_entries
    SELECT DISTINCT id AS entry
    FROM classicmangos.gameobject
    WHERE map IN (0, 1);

    /* overwrite Trinity data for the classic continents */
    DELETE FROM barracksworld.gameobject
    WHERE guid IN (SELECT guid FROM tmp_classic_go_guids);

    INSERT INTO barracksworld.gameobject (
        `guid`,
        `id`,
        `map`,
        `zoneId`,
        `areaId`,
        `spawnMask`,
        `phaseMask`,
        `position_x`,
        `position_y`,
        `position_z`,
        `orientation`,
        `rotation0`,
        `rotation1`,
        `rotation2`,
        `rotation3`,
        `spawntimesecs`,
        `animprogress`,
        `state`,
        `ScriptName`,
        `VerifiedBuild`
    )
    SELECT
        go.guid,
        go.id,
        go.map,
        0 AS zoneId,
        0 AS areaId,
        go.spawnMask,
        1 AS phaseMask,
        go.position_x,
        go.position_y,
        go.position_z,
        go.orientation,
        go.rotation0,
        go.rotation1,
        go.rotation2,
        go.rotation3,
        GREATEST(go.spawntimesecsmax, go.spawntimesecsmin) AS spawntimesecs,
        LEAST(GREATEST(COALESCE(goa.animprogress, 0), 0), 255) AS animprogress,
        GREATEST(COALESCE(goa.state, 0), 0) AS state,
        '' AS ScriptName,
        0 AS VerifiedBuild
    FROM classicmangos.gameobject go
    LEFT JOIN classicmangos.gameobject_addon goa ON goa.guid = go.guid
    WHERE go.map IN (0, 1);

    DELETE FROM barracksworld.gameobject_addon
    WHERE guid IN (SELECT guid FROM tmp_classic_go_guids);

    INSERT INTO barracksworld.gameobject_addon (
        `guid`,
        `parent_rotation0`,
        `parent_rotation1`,
        `parent_rotation2`,
        `parent_rotation3`,
        `invisibilityType`,
        `invisibilityValue`
    )
    SELECT
        ga.guid,
        0 AS parent_rotation0,
        0 AS parent_rotation1,
        0 AS parent_rotation2,
        1 AS parent_rotation3,
        0 AS invisibilityType,
        0 AS invisibilityValue
    FROM classicmangos.gameobject_addon ga
    INNER JOIN tmp_classic_go_guids g ON g.guid = ga.guid;

    DELETE FROM barracksworld.game_event_gameobject
    WHERE guid IN (SELECT guid FROM tmp_classic_go_guids);

    INSERT INTO barracksworld.game_event_gameobject (
        `eventEntry`,
        `guid`
    )
    SELECT
        geg.event AS eventEntry,
        geg.guid
    FROM classicmangos.game_event_gameobject geg
    INNER JOIN tmp_classic_go_guids g ON g.guid = geg.guid;

    DELETE FROM barracksworld.gameobject_loot_template
    WHERE Entry IN (SELECT entry FROM tmp_classic_go_entries);

    INSERT INTO barracksworld.gameobject_loot_template (
        `Entry`,
        `Item`,
        `Reference`,
        `Chance`,
        `QuestRequired`,
        `LootMode`,
        `GroupId`,
        `MinCount`,
        `MaxCount`,
        `Comment`
    )
    SELECT
        glt.entry AS Entry,
        glt.item AS Item,
        CASE WHEN glt.mincountOrRef < 0 THEN ABS(glt.mincountOrRef) ELSE 0 END AS Reference,
        ABS(glt.ChanceOrQuestChance) AS Chance,
        CASE WHEN glt.ChanceOrQuestChance < 0 THEN 1 ELSE 0 END AS QuestRequired,
        1 AS LootMode,
        glt.groupid AS GroupId,
        CASE WHEN glt.mincountOrRef < 0 THEN 0 ELSE glt.mincountOrRef END AS MinCount,
        CASE WHEN glt.mincountOrRef < 0 THEN 0 ELSE glt.maxcount END AS MaxCount,
        glt.comments AS Comment
    FROM classicmangos.gameobject_loot_template glt
    INNER JOIN tmp_classic_go_entries e ON e.entry = glt.entry;

    DELETE FROM barracksworld.gameobject_queststarter
    WHERE id IN (SELECT entry FROM tmp_classic_go_entries);

    INSERT INTO barracksworld.gameobject_queststarter (
        `id`,
        `quest`
    )
    SELECT
        gqr.id,
        gqr.quest
    FROM classicmangos.gameobject_questrelation gqr
    INNER JOIN tmp_classic_go_entries e ON e.entry = gqr.id;

    DELETE FROM barracksworld.gameobject_questender
    WHERE id IN (SELECT entry FROM tmp_classic_go_entries);

    INSERT INTO barracksworld.gameobject_questender (
        `id`,
        `quest`
    )
    SELECT
        gir.id,
        gir.quest
    FROM classicmangos.gameobject_involvedrelation gir
    INNER JOIN tmp_classic_go_entries e ON e.entry = gir.id;

    DELETE FROM barracksworld.gameobject_template
    WHERE entry IN (SELECT entry FROM tmp_classic_go_entries);

    INSERT INTO barracksworld.gameobject_template (
        `entry`,
        `type`,
        `displayId`,
        `name`,
        `IconName`,
        `castBarCaption`,
        `unk1`,
        `size`,
        `Data0`,
        `Data1`,
        `Data2`,
        `Data3`,
        `Data4`,
        `Data5`,
        `Data6`,
        `Data7`,
        `Data8`,
        `Data9`,
        `Data10`,
        `Data11`,
        `Data12`,
        `Data13`,
        `Data14`,
        `Data15`,
        `Data16`,
        `Data17`,
        `Data18`,
        `Data19`,
        `Data20`,
        `Data21`,
        `Data22`,
        `Data23`,
        `AIName`,
        `ScriptName`,
        `VerifiedBuild`
    )
    SELECT
        gt.entry,
        gt.type,
        gt.displayId,
        gt.name,
        '' AS IconName,
        '' AS castBarCaption,
        '' AS unk1,
        gt.size,
        gt.data0,
        gt.data1,
        gt.data2,
        gt.data3,
        gt.data4,
        gt.data5,
        gt.data6,
        gt.data7,
        gt.data8,
        gt.data9,
        gt.data10,
        gt.data11,
        gt.data12,
        gt.data13,
        gt.data14,
        gt.data15,
        gt.data16,
        gt.data17,
        gt.data18,
        gt.data19,
        gt.data20,
        gt.data21,
        gt.data22,
        gt.data23,
        '' AS AIName,
        gt.ScriptName,
        0 AS VerifiedBuild
    FROM classicmangos.gameobject_template gt
    INNER JOIN tmp_classic_go_entries e ON e.entry = gt.entry;

    DELETE FROM barracksworld.gameobject_template_addon
    WHERE entry IN (SELECT entry FROM tmp_classic_go_entries);

    INSERT INTO barracksworld.gameobject_template_addon (
        `entry`,
        `faction`,
        `flags`,
        `mingold`,
        `maxgold`,
        `artkit0`,
        `artkit1`,
        `artkit2`,
        `artkit3`
    )
    SELECT
        gt.entry,
        gt.faction,
        gt.flags | gt.ExtraFlags AS flags,
        gt.mingold,
        gt.maxgold,
        COALESCE(gta.Artkit0, 0) AS artkit0,
        COALESCE(gta.Artkit1, 0) AS artkit1,
        COALESCE(gta.Artkit2, 0) AS artkit2,
        COALESCE(gta.Artkit3, 0) AS artkit3
    FROM classicmangos.gameobject_template gt
    INNER JOIN tmp_classic_go_entries e ON e.entry = gt.entry
    LEFT JOIN classicmangos.gameobject_template_addon gta ON gta.Entry = gt.entry;

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_go_guids;
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_go_entries;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;
