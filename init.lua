-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/init.lua
-- inits the mod
-- =====================================
-- [regis-item] Cup
-- [craft] Cup
-- [regis-food] Cigerette (-4)
-- =====================================

print ("Food: Loading extension: [Modern]")

----------------------Load Files-----------------------------


dofile(minetest.get_modpath("food_modern").."/food/sandwich.lua")

dofile(minetest.get_modpath("food_modern").."/snacks/misc.lua")

dofile(minetest.get_modpath("food_modern").."/drinks/hot.lua")
dofile(minetest.get_modpath("food_modern").."/drinks/milkshakes.lua")

print("Food: food_modern extension loaded")
