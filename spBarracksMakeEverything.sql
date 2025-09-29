CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksMakeEverything`()
BEGIN
	call spBarracksResetCreatures;
    call spBarracks_Backport_CMaNGOS_Creatures(0, 12340);
    call spBarracks_Backport_Classic_Quests_OldWorld(12340);
    call spBarracksMakeTrainers;
    call spBarracksMakeItems;
END