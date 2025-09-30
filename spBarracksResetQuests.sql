DELIMITER $$

DROP PROCEDURE IF EXISTS `spBarracksResetQuests`$$

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
    SELECT DISTINCT qt.entry AS questId
    FROM classicmangos.quest_template qt;

    /* overwrite Trinity data with classic quest data */
    DELETE FROM barracksworld.quest_template
    WHERE ID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_template (
        ID,
        QuestType,
        QuestLevel,
        MinLevel,
        QuestSortID,
        QuestInfoID,
        SuggestedGroupNum,
        RequiredFactionId1,
        RequiredFactionId2,
        RequiredFactionValue1,
        RequiredFactionValue2,
        RewardNextQuest,
        RewardXPDifficulty,
        RewardMoney,
        RewardBonusMoney,
        RewardDisplaySpell,
        RewardSpell,
        RewardHonor,
        RewardKillHonor,
        StartItem,
        Flags,
        RequiredPlayerKills,
        RewardItem1,
        RewardAmount1,
        RewardItem2,
        RewardAmount2,
        RewardItem3,
        RewardAmount3,
        RewardItem4,
        RewardAmount4,
        ItemDrop1,
        ItemDropQuantity1,
        ItemDrop2,
        ItemDropQuantity2,
        ItemDrop3,
        ItemDropQuantity3,
        ItemDrop4,
        ItemDropQuantity4,
        RewardChoiceItemID1,
        RewardChoiceItemQuantity1,
        RewardChoiceItemID2,
        RewardChoiceItemQuantity2,
        RewardChoiceItemID3,
        RewardChoiceItemQuantity3,
        RewardChoiceItemID4,
        RewardChoiceItemQuantity4,
        RewardChoiceItemID5,
        RewardChoiceItemQuantity5,
        RewardChoiceItemID6,
        RewardChoiceItemQuantity6,
        POIContinent,
        POIx,
        POIy,
        POIPriority,
        RewardTitle,
        RewardTalents,
        RewardArenaPoints,
        RewardFactionID1,
        RewardFactionValue1,
        RewardFactionOverride1,
        RewardFactionID2,
        RewardFactionValue2,
        RewardFactionOverride2,
        RewardFactionID3,
        RewardFactionValue3,
        RewardFactionOverride3,
        RewardFactionID4,
        RewardFactionValue4,
        RewardFactionOverride4,
        RewardFactionID5,
        RewardFactionValue5,
        RewardFactionOverride5,
        TimeAllowed,
        AllowableRaces,
        LogTitle,
        LogDescription,
        QuestDescription,
        AreaDescription,
        QuestCompletionLog,
        RequiredNpcOrGo1,
        RequiredNpcOrGo2,
        RequiredNpcOrGo3,
        RequiredNpcOrGo4,
        RequiredNpcOrGoCount1,
        RequiredNpcOrGoCount2,
        RequiredNpcOrGoCount3,
        RequiredNpcOrGoCount4,
        RequiredItemId1,
        RequiredItemId2,
        RequiredItemId3,
        RequiredItemId4,
        RequiredItemId5,
        RequiredItemId6,
        RequiredItemCount1,
        RequiredItemCount2,
        RequiredItemCount3,
        RequiredItemCount4,
        RequiredItemCount5,
        RequiredItemCount6,
        Unknown0,
        ObjectiveText1,
        ObjectiveText2,
        ObjectiveText3,
        ObjectiveText4,
        VerifiedBuild
    )
    SELECT
        qt.entry AS ID,
        qt.Method AS QuestType,
        qt.QuestLevel,
        qt.MinLevel,
        qt.ZoneOrSort AS QuestSortID,
        qt.Type AS QuestInfoID,
        qt.SuggestedPlayers AS SuggestedGroupNum,
        qt.RequiredMinRepFaction AS RequiredFactionId1,
        qt.RequiredMaxRepFaction AS RequiredFactionId2,
        qt.RequiredMinRepValue AS RequiredFactionValue1,
        qt.RequiredMaxRepValue AS RequiredFactionValue2,
        GREATEST(qt.NextQuestId, 0) AS RewardNextQuest,
        0 AS RewardXPDifficulty,
        qt.RewOrReqMoney AS RewardMoney,
        qt.RewMoneyMaxLevel AS RewardBonusMoney,
        qt.RewSpellCast AS RewardDisplaySpell,
        qt.RewSpell AS RewardSpell,
        0 AS RewardHonor,
        0 AS RewardKillHonor,
        qt.SrcItemId AS StartItem,
        qt.QuestFlags AS Flags,
        0 AS RequiredPlayerKills,
        qt.RewItemId1 AS RewardItem1,
        qt.RewItemCount1 AS RewardAmount1,
        qt.RewItemId2 AS RewardItem2,
        qt.RewItemCount2 AS RewardAmount2,
        qt.RewItemId3 AS RewardItem3,
        qt.RewItemCount3 AS RewardAmount3,
        qt.RewItemId4 AS RewardItem4,
        qt.RewItemCount4 AS RewardAmount4,
        qt.ReqSourceId1 AS ItemDrop1,
        qt.ReqSourceCount1 AS ItemDropQuantity1,
        qt.ReqSourceId2 AS ItemDrop2,
        qt.ReqSourceCount2 AS ItemDropQuantity2,
        qt.ReqSourceId3 AS ItemDrop3,
        qt.ReqSourceCount3 AS ItemDropQuantity3,
        qt.ReqSourceId4 AS ItemDrop4,
        qt.ReqSourceCount4 AS ItemDropQuantity4,
        qt.RewChoiceItemId1 AS RewardChoiceItemID1,
        qt.RewChoiceItemCount1 AS RewardChoiceItemQuantity1,
        qt.RewChoiceItemId2 AS RewardChoiceItemID2,
        qt.RewChoiceItemCount2 AS RewardChoiceItemQuantity2,
        qt.RewChoiceItemId3 AS RewardChoiceItemID3,
        qt.RewChoiceItemCount3 AS RewardChoiceItemQuantity3,
        qt.RewChoiceItemId4 AS RewardChoiceItemID4,
        qt.RewChoiceItemCount4 AS RewardChoiceItemQuantity4,
        qt.RewChoiceItemId5 AS RewardChoiceItemID5,
        qt.RewChoiceItemCount5 AS RewardChoiceItemQuantity5,
        qt.RewChoiceItemId6 AS RewardChoiceItemID6,
        qt.RewChoiceItemCount6 AS RewardChoiceItemQuantity6,
        qt.PointMapId AS POIContinent,
        qt.PointX AS POIx,
        qt.PointY AS POIy,
        qt.PointOpt AS POIPriority,
        0 AS RewardTitle,
        0 AS RewardTalents,
        0 AS RewardArenaPoints,
        qt.RewRepFaction1 AS RewardFactionID1,
        qt.RewRepValue1 AS RewardFactionValue1,
        0 AS RewardFactionOverride1,
        qt.RewRepFaction2 AS RewardFactionID2,
        qt.RewRepValue2 AS RewardFactionValue2,
        0 AS RewardFactionOverride2,
        qt.RewRepFaction3 AS RewardFactionID3,
        qt.RewRepValue3 AS RewardFactionValue3,
        0 AS RewardFactionOverride3,
        qt.RewRepFaction4 AS RewardFactionID4,
        qt.RewRepValue4 AS RewardFactionValue4,
        0 AS RewardFactionOverride4,
        qt.RewRepFaction5 AS RewardFactionID5,
        qt.RewRepValue5 AS RewardFactionValue5,
        0 AS RewardFactionOverride5,
        qt.LimitTime AS TimeAllowed,
        qt.RequiredRaces AS AllowableRaces,
        qt.Title AS LogTitle,
        qt.Details AS LogDescription,
        qt.Objectives AS QuestDescription,
        qt.RequestItemsText AS AreaDescription,
        CONCAT_WS('\n\n', NULLIF(qt.OfferRewardText, ''), NULLIF(qt.EndText, '')) AS QuestCompletionLog,
        qt.ReqCreatureOrGOId1 AS RequiredNpcOrGo1,
        qt.ReqCreatureOrGOId2 AS RequiredNpcOrGo2,
        qt.ReqCreatureOrGOId3 AS RequiredNpcOrGo3,
        qt.ReqCreatureOrGOId4 AS RequiredNpcOrGo4,
        qt.ReqCreatureOrGOCount1 AS RequiredNpcOrGoCount1,
        qt.ReqCreatureOrGOCount2 AS RequiredNpcOrGoCount2,
        qt.ReqCreatureOrGOCount3 AS RequiredNpcOrGoCount3,
        qt.ReqCreatureOrGOCount4 AS RequiredNpcOrGoCount4,
        qt.ReqItemId1 AS RequiredItemId1,
        qt.ReqItemId2 AS RequiredItemId2,
        qt.ReqItemId3 AS RequiredItemId3,
        qt.ReqItemId4 AS RequiredItemId4,
        0 AS RequiredItemId5,
        0 AS RequiredItemId6,
        qt.ReqItemCount1 AS RequiredItemCount1,
        qt.ReqItemCount2 AS RequiredItemCount2,
        qt.ReqItemCount3 AS RequiredItemCount3,
        qt.ReqItemCount4 AS RequiredItemCount4,
        0 AS RequiredItemCount5,
        0 AS RequiredItemCount6,
        qt.SpecialFlags AS Unknown0,
        qt.ObjectiveText1,
        qt.ObjectiveText2,
        qt.ObjectiveText3,
        qt.ObjectiveText4,
        0 AS VerifiedBuild
    FROM classicmangos.quest_template qt;

    DELETE FROM barracksworld.quest_poi
    WHERE QuestID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_poi (
        QuestID,
        id,
        ObjectiveIndex,
        MapID,
        WorldMapAreaId,
        Floor,
        Priority,
        Flags,
        VerifiedBuild
    )
    SELECT
        qp.questId AS QuestID,
        qp.poiId AS id,
        qp.objIndex AS ObjectiveIndex,
        qp.mapId AS MapID,
        qp.mapAreaId AS WorldMapAreaId,
        qp.floorId AS Floor,
        qp.unk3 AS Priority,
        qp.unk4 AS Flags,
        0 AS VerifiedBuild
    FROM classicmangos.quest_poi qp
    INNER JOIN tmp_classic_quest_ids q ON q.questId = qp.questId;

    DELETE FROM barracksworld.quest_poi_points
    WHERE QuestID IN (SELECT questId FROM tmp_classic_quest_ids);

    INSERT INTO barracksworld.quest_poi_points (
        QuestID,
        Idx1,
        Idx2,
        X,
        Y,
        VerifiedBuild
    )
    SELECT
        qpp.questId AS QuestID,
        qpp.poiId AS Idx1,
        ROW_NUMBER() OVER (PARTITION BY qpp.questId, qpp.poiId ORDER BY qpp.questId, qpp.poiId, qpp.x, qpp.y) - 1 AS Idx2,
        qpp.x AS X,
        qpp.y AS Y,
        0 AS VerifiedBuild
    FROM classicmangos.quest_poi_points qpp
    INNER JOIN tmp_classic_quest_ids q ON q.questId = qpp.questId;

    DROP TEMPORARY TABLE IF EXISTS tmp_classic_quest_ids;

    SET FOREIGN_KEY_CHECKS = v_old_foreign_key_checks;
END$$

DELIMITER ;
