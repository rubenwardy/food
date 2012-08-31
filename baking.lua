-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/baking.lua
-- adds bread and pies
-- =====================================
-- [regis-food] Bread
-- =====================================

print "RubenFood [Master] - Loading Crumbles"
--Crumbles
minetest.register_craftitem("food:crumble_rhubarb", {
	description = "Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb.png",
	on_use = minetest.item_eat(30),
})

minetest.register_craftitem("food:crumble_rhubarb_raw", {
	description = "Raw Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb_raw.png",
})

minetest.register_craft({
	output = '"food:crumble_rhubarb_raw" 1',
	recipe = {
		{'"food:flour"','"food:rhubarb"','"food:butter"'}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:crumble_rhubarb",
	recipe = "food:crumble_rhubarb_raw",
})

minetest.register_craft({
	output = '"food:bread_slice" 10',
	recipe = {
		{'"food:bread"'},
	}
})

minetest.register_craftitem("food:bread_slice", {
	description = "Bread Slice",
	inventory_image = "food_bread_slice.png",
	on_use = minetest.item_eat(2),
})


print "RubenFood [Master] - Loading Dough"
-- doughs
if not minetest.get_modpath("farming") then

else
minetest.register_craftitem(":farming:cake_mix", {
	description = "Dough",
	inventory_image = "farming_cake_mix.png",
})
end