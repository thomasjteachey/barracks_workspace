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

    /* identify classic guids, entries, and model display identifiers for Azeroth (maps 0 and 1) */
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

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_model_ids;
    CREATE TEMPORARY TABLE tmp_classic_model_ids
    SELECT DISTINCT modelId AS displayId
    FROM (
        SELECT ModelId1 AS modelId FROM classicmangos.creature_template
        UNION ALL
        SELECT ModelId2 AS modelId FROM classicmangos.creature_template
        UNION ALL
        SELECT ModelId3 AS modelId FROM classicmangos.creature_template
        UNION ALL
        SELECT ModelId4 AS modelId FROM classicmangos.creature_template
    ) AS models
    WHERE modelId IS NOT NULL AND modelId <> 0;

    /* overwrite Trinity data for the classic continents */
    DELETE FROM barracksworld.creature
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.creature (
        guid,
        id,
        map,
        zoneId,
        areaId,
        spawnMask,
        phaseMask,
        modelid,
        equipment_id,
        position_x,
        position_y,
        position_z,
        orientation,
        spawntimesecs,
        wander_distance,
        currentwaypoint,
        curhealth,
        curmana,
        MovementType,
        npcflag,
        unit_flags,
        dynamicflags,
        ScriptName,
        VerifiedBuild
    )
    SELECT
        c.guid,
        c.id,
        c.map,
        0 AS zoneId,
        0 AS areaId,
        c.spawnMask,
        1 AS phaseMask,
        0 AS modelid,
        0 AS equipment_id,
        c.position_x,
        c.position_y,
        c.position_z,
        c.orientation,
        GREATEST(c.spawntimesecsmax, c.spawntimesecsmin) AS spawntimesecs,
        c.spawndist AS wander_distance,
        0 AS currentwaypoint,
        GREATEST(IFNULL(ct.MaxLevelHealth, 1), 1) AS curhealth,
        GREATEST(IFNULL(ct.MaxLevelMana, 0), 0) AS curmana,
        c.MovementType,
        IFNULL(ct.NpcFlags, 0) AS npcflag,
        IFNULL(ct.UnitFlags, 0) AS unit_flags,
        IFNULL(ct.DynamicFlags, 0) AS dynamicflags,
        '' AS ScriptName,
        0 AS VerifiedBuild
    FROM classicmangos.creature c
    LEFT JOIN classicmangos.creature_template ct ON ct.Entry = c.id
    WHERE c.map IN (0, 1);

    DELETE FROM barracksworld.creature_addon
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.creature_addon (
        guid,
        path_id,
        mount,
        MountCreatureID,
        StandState,
        AnimTier,
        VisFlags,
        SheathState,
        PvPFlags,
        emote,
        visibilityDistanceType,
        auras
    )
    SELECT
        ca.guid,
        0 AS path_id,
        ca.mount,
        0 AS MountCreatureID,
        ca.stand_state AS StandState,
        0 AS AnimTier,
        0 AS VisFlags,
        ca.sheath_state AS SheathState,
        0 AS PvPFlags,
        ca.emote,
        0 AS visibilityDistanceType,
        ca.auras
    FROM classicmangos.creature_addon ca
    INNER JOIN tmp_classic_creature_guids g ON g.guid = ca.guid;

    DELETE FROM barracksworld.game_event_creature
    WHERE guid IN (SELECT guid FROM tmp_classic_creature_guids);

    INSERT INTO barracksworld.game_event_creature (
        eventEntry,
        guid
    )
    SELECT
        gec.`event`,
        gec.guid
    FROM classicmangos.game_event_creature gec
    INNER JOIN tmp_classic_creature_guids g ON g.guid = gec.guid;

    DELETE FROM barracksworld.creature_template
    WHERE entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_template (
        entry,
        difficulty_entry_1,
        difficulty_entry_2,
        difficulty_entry_3,
        KillCredit1,
        KillCredit2,
        modelid1,
        modelid2,
        modelid3,
        modelid4,
        name,
        subname,
        IconName,
        gossip_menu_id,
        minlevel,
        maxlevel,
        exp,
        faction,
        npcflag,
        speed_walk,
        speed_run,
        scale,
        rank,
        dmgschool,
        BaseAttackTime,
        RangeAttackTime,
        BaseVariance,
        RangeVariance,
        unit_class,
        unit_flags,
        unit_flags2,
        dynamicflags,
        family,
        type,
        type_flags,
        lootid,
        pickpocketloot,
        skinloot,
        PetSpellDataId,
        VehicleId,
        mingold,
        maxgold,
        AIName,
        MovementType,
        HoverHeight,
        HealthModifier,
        ManaModifier,
        ArmorModifier,
        DamageModifier,
        ExperienceModifier,
        RacialLeader,
        movementId,
        RegenHealth,
        mechanic_immune_mask,
        spell_school_immune_mask,
        flags_extra,
        ScriptName,
        VerifiedBuild
    )
    SELECT
        ct.Entry,
        0 AS difficulty_entry_1,
        0 AS difficulty_entry_2,
        0 AS difficulty_entry_3,
        ct.KillCredit1,
        ct.KillCredit2,
        ct.ModelId1,
        ct.ModelId2,
        ct.ModelId3,
        ct.ModelId4,
        ct.Name,
        ct.SubName,
        NULL AS IconName,
        ct.GossipMenuId,
        ct.MinLevel,
        ct.MaxLevel,
        0 AS exp,
        ct.Faction,
        ct.NpcFlags,
        ct.SpeedWalk,
        ct.SpeedRun,
        ct.Scale,
        ct.Rank,
        ct.DamageSchool,
        ct.MeleeBaseAttackTime,
        ct.RangedBaseAttackTime,
        ct.DamageVariance AS BaseVariance,
        ct.DamageVariance AS RangeVariance,
        ct.UnitClass,
        ct.UnitFlags,
        0 AS unit_flags2,
        ct.DynamicFlags,
        ct.Family,
        ct.CreatureType,
        ct.CreatureTypeFlags,
        ct.LootId,
        ct.PickpocketLootId,
        ct.SkinningLootId,
        ct.PetSpellDataId,
        0 AS VehicleId,
        ct.MinLootGold,
        ct.MaxLootGold,
        ct.AIName,
        ct.MovementType,
        1 AS HoverHeight,
        ct.HealthMultiplier,
        ct.PowerMultiplier,
        ct.ArmorMultiplier,
        ct.DamageMultiplier,
        ct.ExperienceMultiplier,
        ct.RacialLeader,
        0 AS movementId,
        CASE WHEN (ct.RegenerateStats & 1) <> 0 THEN 1 ELSE 0 END AS RegenHealth,
        ct.MechanicImmuneMask,
        ct.SchoolImmuneMask,
        ct.ExtraFlags,
        ct.ScriptName,
        0 AS VerifiedBuild
    FROM classicmangos.creature_template ct
    INNER JOIN tmp_classic_creature_entries e ON e.entry = ct.Entry;

    DELETE FROM barracksworld.creature_template_addon
    WHERE entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_template_addon (
        entry,
        path_id,
        mount,
        MountCreatureID,
        StandState,
        AnimTier,
        VisFlags,
        SheathState,
        PvPFlags,
        emote,
        visibilityDistanceType,
        auras
    )
    SELECT
        cta.entry,
        0 AS path_id,
        cta.mount,
        0 AS MountCreatureID,
        cta.stand_state AS StandState,
        0 AS AnimTier,
        0 AS VisFlags,
        cta.sheath_state AS SheathState,
        0 AS PvPFlags,
        cta.emote,
        0 AS visibilityDistanceType,
        cta.auras
    FROM classicmangos.creature_template_addon cta
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cta.entry;

    DELETE FROM barracksworld.creature_equip_template
    WHERE CreatureID IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_equip_template (
        CreatureID,
        ID,
        ItemID1,
        ItemID2,
        ItemID3,
        VerifiedBuild
    )
    SELECT
        cet.entry,
        1 AS ID,
        cet.equipentry1,
        cet.equipentry2,
        cet.equipentry3,
        NULL AS VerifiedBuild
    FROM classicmangos.creature_equip_template cet
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cet.entry;

    DELETE FROM barracksworld.creature_loot_template
    WHERE Entry IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_loot_template (
        Entry,
        Item,
        Reference,
        Chance,
        QuestRequired,
        LootMode,
        GroupId,
        MinCount,
        MaxCount,
        Comment
    )
    SELECT
        clt.entry AS Entry,
        clt.item AS Item,
        CASE WHEN clt.mincountOrRef < 0 THEN -clt.mincountOrRef ELSE 0 END AS Reference,
        ABS(clt.ChanceOrQuestChance) AS Chance,
        CASE WHEN clt.ChanceOrQuestChance < 0 THEN 1 ELSE 0 END AS QuestRequired,
        1 AS LootMode,
        clt.groupid AS GroupId,
        CASE WHEN clt.mincountOrRef < 0 THEN 0 ELSE clt.mincountOrRef END AS MinCount,
        CASE WHEN clt.mincountOrRef < 0 THEN 0 ELSE clt.maxcount END AS MaxCount,
        clt.comments AS Comment
    FROM classicmangos.creature_loot_template clt
    INNER JOIN tmp_classic_creature_entries e ON e.entry = clt.entry;

    DELETE FROM barracksworld.creature_model_info
    WHERE DisplayID IN (SELECT displayId FROM tmp_classic_model_ids);

    INSERT INTO barracksworld.creature_model_info (
        DisplayID,
        BoundingRadius,
        CombatReach,
        Gender,
        DisplayID_Other_Gender
    )
    SELECT
        cmi.modelid AS DisplayID,
        cmi.bounding_radius AS BoundingRadius,
        cmi.combat_reach AS CombatReach,
        cmi.gender AS Gender,
        cmi.modelid_other_gender AS DisplayID_Other_Gender
    FROM classicmangos.creature_model_info cmi
    INNER JOIN tmp_classic_model_ids m ON m.displayId = cmi.modelid;

    DELETE FROM barracksworld.creature_onkill_reputation
    WHERE creature_id IN (SELECT entry FROM tmp_classic_creature_entries);

    INSERT INTO barracksworld.creature_onkill_reputation (
        creature_id,
        RewOnKillRepFaction1,
        RewOnKillRepFaction2,
        MaxStanding1,
        IsTeamAward1,
        RewOnKillRepValue1,
        MaxStanding2,
        IsTeamAward2,
        RewOnKillRepValue2,
        TeamDependent
    )
    SELECT
        cok.creature_id,
        cok.RewOnKillRepFaction1,
        cok.RewOnKillRepFaction2,
        cok.MaxStanding1,
        cok.IsTeamAward1,
        cok.RewOnKillRepValue1,
        cok.MaxStanding2,
        cok.IsTeamAward2,
        cok.RewOnKillRepValue2,
        cok.TeamDependent
    FROM classicmangos.creature_onkill_reputation cok
    INNER JOIN tmp_classic_creature_entries e ON e.entry = cok.creature_id;

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_guids;
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_creature_entries;
    DROP TEMPORARY TABLE IF EXISTS tmp_classic_model_ids;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;
