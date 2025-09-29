CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksMakeEverything`()
BEGIN
	call spBarracksResetCreatures;
	call spBarracksResetQuests;
    call spBarracksMakeTrainers;
    call spBarracksMakeItems;
END