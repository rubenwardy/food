-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/snacks/crumbles.lua
-- adds crumbles
-- =====================================
-- [regis-food] Rhubarb Crumble
-- =====================================

print "Food [Master] - Loading Crumbles"
--Crumbles
minetest.register_craftitem("food:crumble_rhubarb", {
	description = "Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb.png",
	on_use = minetest.item_eat(30),
	groups={food=3},
})

minetest.register_craftitem("food:crumble_rhubarb_raw", {
	description = "Raw Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb_raw.png",
})

minetest.register_craft({
	output = '"food:crumble_rhubarb_raw" 1',
	recipe = {
	{'"food:sugar"',"",""},
		{'"food:flour"','"food:rhubarb"','"food:butter"'}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:crumble_rhubarb",
	recipe = "food:crumble_rhubarb_raw",
})
