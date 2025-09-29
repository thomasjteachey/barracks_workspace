CREATE DEFINER=`brokilodeluxe`@`%` PROCEDURE `spBarracksMakeItems`()
BEGIN
select 'remaking item table';
	drop table if exists barracksworld.item_template;
    create table barracksworld.item_template like trinityworld.item_template;
    alter table barracksworld.item_template 
    ;
    alter table barracksworld.item_template modify scriptName char(64); 
    insert into barracksworld.item_template select wit.* from trinityworld.item_template wit;

select 'reverting item attributes to classic';
update barracksworld.item_template it join classicmangos.item_template vit on it.entry = vit.entry
set it.class = vit.class,it.subclass = vit.subclass,it.name = vit.name,it.displayid = vit.displayid,it.Quality = vit.Quality,it.Flags = vit.Flags,it.BuyCount = vit.BuyCount,
it.BuyPrice = vit.BuyPrice,it.SellPrice = vit.SellPrice,it.InventoryType = vit.InventoryType,it.AllowableClass = vit.AllowableClass,it.AllowableRace = vit.AllowableRace,
it.ItemLevel = vit.ItemLevel,it.RequiredLevel = vit.RequiredLevel,it.RequiredSkill = vit.RequiredSkill,it.RequiredSkillRank = vit.RequiredSkillRank,
it.requiredspell = vit.requiredspell,it.requiredhonorrank = vit.requiredhonorrank,it.RequiredCityRank = vit.RequiredCityRank,
it.RequiredReputationFaction = vit.RequiredReputationFaction,it.RequiredReputationRank = vit.RequiredReputationRank,it.maxcount = vit.maxcount,it.stackable = vit.stackable,
it.ContainerSlots = vit.ContainerSlots,it.stat_type1 = vit.stat_type1,it.stat_value1 = vit.stat_value1,it.stat_type2 = vit.stat_type2,it.stat_value2 = vit.stat_value2,
it.stat_type3 = vit.stat_type3,it.stat_value3 = vit.stat_value3,it.stat_type4 = vit.stat_type4,it.stat_value4 = vit.stat_value4,it.stat_type5 = vit.stat_type5,
it.stat_value5 = vit.stat_value5,it.stat_type6 = vit.stat_type6,it.stat_value6 = vit.stat_value6,it.stat_type7 = vit.stat_type7,it.stat_value7 = vit.stat_value7,
it.stat_type8 = vit.stat_type8,it.stat_value8 = vit.stat_value8,it.stat_type9 = vit.stat_type9,it.stat_value9 = vit.stat_value9,it.stat_type10 = vit.stat_type10,
it.stat_value10 = vit.stat_value10,it.dmg_min1 = vit.dmg_min1,it.dmg_max1 = vit.dmg_max1,it.dmg_type1 = vit.dmg_type1,it.dmg_min2 = vit.dmg_min2,it.dmg_max2 = vit.dmg_max2,
it.dmg_type2 = vit.dmg_type2,it.armor = vit.armor,it.holy_res = vit.holy_res,it.fire_res = vit.fire_res,it.nature_res = vit.nature_res,it.frost_res = vit.frost_res,
it.shadow_res = vit.shadow_res,it.arcane_res = vit.arcane_res,it.delay = vit.delay,it.ammo_type = vit.ammo_type,it.RangedModRange = vit.RangedModRange,it.spellid_1 = vit.spellid_1,
it.spelltrigger_1 = vit.spelltrigger_1,it.spellcharges_1 = vit.spellcharges_1,it.spellppmRate_1 = vit.spellppmRate_1,it.spellcooldown_1 = vit.spellcooldown_1,
it.spellcategory_1 = vit.spellcategory_1,it.spellcategorycooldown_1 = vit.spellcategorycooldown_1,it.spellid_2 = vit.spellid_2,it.spelltrigger_2 = vit.spelltrigger_2,
it.spellcharges_2 = vit.spellcharges_2,it.spellppmRate_2 = vit.spellppmRate_2,it.spellcooldown_2 = vit.spellcooldown_2,it.spellcategory_2 = vit.spellcategory_2,
it.spellcategorycooldown_2 = vit.spellcategorycooldown_2,it.spellid_3 = vit.spellid_3,it.spelltrigger_3 = vit.spelltrigger_3,it.spellcharges_3 = vit.spellcharges_3,
it.spellppmRate_3 = vit.spellppmRate_3,it.spellcooldown_3 = vit.spellcooldown_3,it.spellcategory_3 = vit.spellcategory_3,it.spellcategorycooldown_3 = vit.spellcategorycooldown_3,
it.spellid_4 = vit.spellid_4,it.spelltrigger_4 = vit.spelltrigger_4,it.spellcharges_4 = vit.spellcharges_4,it.spellppmRate_4 = vit.spellppmRate_4,
it.spellcooldown_4 = vit.spellcooldown_4,it.spellcategory_4 = vit.spellcategory_4,it.spellcategorycooldown_4 = vit.spellcategorycooldown_4,it.spellid_5 = vit.spellid_5,
it.spelltrigger_5 = vit.spelltrigger_5,it.spellcharges_5 = vit.spellcharges_5,it.spellppmRate_5 = vit.spellppmRate_5,it.spellcooldown_5 = vit.spellcooldown_5,
it.spellcategory_5 = vit.spellcategory_5,it.spellcategorycooldown_5 = vit.spellcategorycooldown_5,it.bonding = vit.bonding,it.description = vit.description,it.PageText = vit.PageText,
it.LanguageID = vit.LanguageID,it.PageMaterial = vit.PageMaterial,it.startquest = vit.startquest,it.lockid = vit.lockid,it.Material = vit.Material,it.sheath = vit.sheath,
it.RandomProperty = vit.RandomProperty,it.block = vit.block,it.itemset = vit.itemset,it.MaxDurability = vit.MaxDurability,it.area = vit.area,it.Map = vit.Map,
it.BagFamily = vit.BagFamily,it.ScriptName = vit.ScriptName,it.DisenchantID = vit.DisenchantID,it.FoodType = vit.FoodType,it.minMoneyLoot = vit.minMoneyLoot,
it.maxMoneyLoot = vit.maxMoneyLoot
where (it.requiredSkill != 762) #don't revert mount skills
;
    
select 'arena items';   
    #these items are usable in arenas
    update barracksworld.item_template
    set flags = flags + 2097152
    where entry in
    (
		3776,8079,8928,8985,9186,10922,14530,22895,
        19013, 19012, 9421, #healthstones
        8008, #mana ruby
        9449 #manual crowd pummeler
    );
    
select 'done making items!';
END