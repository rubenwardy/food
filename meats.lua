-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/meats.lua
-- adds meat products
-- ======================================
-- [regis-food] Meat
-- ======================================

minetest.register_craftitem("food:meat", {
	description = "Venison",
	inventory_image = "food_meat.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food:meat",
	recipe = "food:meat_raw",
	cooktime = 20
})




