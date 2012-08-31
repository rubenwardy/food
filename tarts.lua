-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/tarts.lua
-- adds diary products
-- ======================================
-- [regis-food] Strawberry Tart
-- ======================================

print "RubenFood [Master] - Loading Tarts"

minetest.register_craftitem("rubenfood:tart_strawberry", {
	description = "Strawberry Tart",
	inventory_image = "ruben_tart_strawberry.png",
	on_use = minetest.item_eat(30),
})

minetest.register_craftitem("rubenfood:tart_base", {
	description = "Tart Base",
	inventory_image = "ruben_tart_base.png",
})

minetest.register_craftitem("rubenfood:tart_base_raw", {
	description = "Raw Tart Base",
	inventory_image = "ruben_tart_base_raw.png",
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:tart_base",
	recipe = "rubenfood:tart_base_raw",
})

minetest.register_craft({
	output = '"rubenfood:tart_strawberry" 1',
	recipe = {
	         {'"rubenfood:strawberry"'},{'"rubenfood:tart_base"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:tart_base_raw" 1',
	recipe = {
	         {'"rubenfood:flour"','"rubenfood:milk"','"rubenfood:egg"'},
	}
})





