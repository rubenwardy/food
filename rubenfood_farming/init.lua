-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood_farming/init.lua
-- adds support for farming by pilzadam
-- =====================================
-- [exten] Farming Mod
-- =====================================

print("RubenFood [Extension] - Adding Farming Extension")

--convert nameholders to relevant farming items
minetest.register_alias("rubenfood:flour", "farming:flour")
 
--convert farming stuff to updated rubenfood stuff
minetest.register_alias("farming:cake_mix", "rubenfood:dough")
minetest.register_alias("farming:bread", "rubenfood:bread")