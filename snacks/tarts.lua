-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/snacks/tarts.lua
-- adds diary products
-- ======================================
-- [regis-food] Strawberry Tart
-- ======================================

print "Food [Master] - Loading Tarts"

minetest.register_craftitem("food:tart_strawberry", {
	description = "Strawberry Tart",
	inventory_image = "food_tart_strawberry.png",
	on_use = minetest.item_eat(30),
	groups={food=3},
})

minetest.register_craftitem("food:tart_base", {
	description = "Tart Base",
	inventory_image = "food_tart_base.png",
})

minetest.register_craftitem("food:tart_base_raw", {
	description = "Raw Tart Base",
	inventory_image = "food_tart_base_raw.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food:tart_base",
	recipe = "food:tart_base_raw",
})

minetest.register_craft({
	output = '"food:tart_strawberry" 1',
	recipe = {
	         {'"food:strawberry"'},{'"food:tart_base"'},
	}
})

minetest.register_craft({
	output = '"food:tart_base_raw" 1',
	recipe = {
	         {'"food:flour"','"food:milk"','"food:egg"'},
	}
})





