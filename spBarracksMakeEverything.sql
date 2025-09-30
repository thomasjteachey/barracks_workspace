CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksMakeEverything`()
BEGIN
    CALL spBarracksResetCreatures;
    CALL spBarracksResetGameobjects;
    CALL spBarracksResetQuests;
    CALL spBarracksMakeTrainers;
    CALL spBarracksMakeItems;
END
