CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksResetCreatures`()
BEGIN
	delete from barracksworld.creature;
    insert into barracksworld.creature select * from trinityworld.creature;
	delete from barracksworld.creature_addon;
    insert into barracksworld.creature_addon select * from trinityworld.creature_addon;
	delete from barracksworld.creature_classlevelstats;
    insert into barracksworld.creature_classlevelstats select * from trinityworld.creature_classlevelstats;
	delete from barracksworld.creature_default_trainer;
    insert into barracksworld.creature_default_trainer select * from trinityworld.creature_default_trainer;
	delete from barracksworld.creature_equip_template;
    insert into barracksworld.creature_equip_template select * from trinityworld.creature_equip_template;
	delete from barracksworld.creature_loot_template;
    insert into barracksworld.creature_loot_template select * from trinityworld.creature_loot_template;
	delete from barracksworld.creature_model_info;
    insert into barracksworld.creature_model_info select * from trinityworld.creature_model_info;
	delete from barracksworld.creature_movement_info;
    insert into barracksworld.creature_movement_info select * from trinityworld.creature_movement_info;
	delete from barracksworld.creature_onkill_reputation;
    insert into barracksworld.creature_onkill_reputation select * from trinityworld.creature_onkill_reputation;
	delete from barracksworld.creature_questender;
    insert into barracksworld.creature_questender select * from trinityworld.creature_questender;
	delete from barracksworld.creature_queststarter;
    insert into barracksworld.creature_queststarter select * from trinityworld.creature_queststarter;
	delete from barracksworld.creature_summon_groups;
    insert into barracksworld.creature_summon_groups select * from trinityworld.creature_summon_groups;
	delete from barracksworld.creature_template;
    insert into barracksworld.creature_template select * from trinityworld.creature_template;
	delete from barracksworld.creature_template_addon;
    insert into barracksworld.creature_template_addon select * from trinityworld.creature_template_addon;
	delete from barracksworld.creature_template_movement;
    insert into barracksworld.creature_template_movement select * from trinityworld.creature_template_movement;
    select 'done reseting creatures';
	delete from barracksworld.game_event_creature;
	insert into barracksworld.game_event_creature
	select * from trinityworld.game_event_creature;
    
    delete from barracksworld.game_event_condition;
	insert into barracksworld.game_event_condition
	select * from trinityworld.game_event_condition;
    
	delete from barracksworld.game_event;
	insert into barracksworld.game_event
	select * from trinityworld.game_event;
    
	delete from barracksworld.game_event_arena_seasons;
	insert into barracksworld.game_event_arena_seasons
	select * from trinityworld.game_event_arena_seasons;    
    
	delete from barracksworld.game_event_creature_quest;
	insert into barracksworld.game_event_creature_quest
	select * from trinityworld.game_event_creature_quest;    
    
	delete from barracksworld.game_event_gameobject;
	insert into barracksworld.game_event_gameobject
	select * from trinityworld.game_event_gameobject;
    
	delete from barracksworld.game_event_gameobject_quest;
	insert into barracksworld.game_event_gameobject_quest
	select * from trinityworld.game_event_gameobject_quest;       
    
	delete from barracksworld.game_event_model_equip;
	insert into barracksworld.game_event_model_equip
	select * from trinityworld.game_event_model_equip;    
    
	delete from barracksworld.game_event_npc_vendor;
	insert into barracksworld.game_event_npc_vendor
	select * from trinityworld.game_event_npc_vendor;        
    
	delete from barracksworld.game_event_npcflag;
	insert into barracksworld.game_event_npcflag
	select * from trinityworld.game_event_npcflag;            
    
	delete from barracksworld.game_event_pool;
	insert into barracksworld.game_event_pool
	select * from trinityworld.game_event_pool;                
    
	delete from barracksworld.game_event_prerequisite;
	insert into barracksworld.game_event_prerequisite
	select * from trinityworld.game_event_prerequisite;                    
    
	delete from barracksworld.game_event_quest_condition;
	insert into barracksworld.game_event_quest_condition
	select * from trinityworld.game_event_quest_condition;                       
    
	delete from barracksworld.game_event_seasonal_questrelation;
	insert into barracksworld.game_event_seasonal_questrelation
	select * from trinityworld.game_event_seasonal_questrelation;                           
    select 'done reseting game_events';
END