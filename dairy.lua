-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/diary.lua
-- adds diary products
-- ======================================
-- [regis-food] Cheese
-- [craft] Cheese
-- [regis-item] Butter
-- [craft] Butter
-- ======================================

minetest.register_craftitem("rubenfood:butter", {
	description = "Butter",
	inventory_image = "ruben_butter.png",
})

minetest.register_craftitem("rubenfood:cheese", {
	description = "Cheese",
	inventory_image = "ruben_cheese.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = '"rubenfood:butter" 1',
	recipe = {
	         {'"rubenfood:milk"','"rubenfood:milk"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:cheese" 1',
	recipe = {
	         {'"rubenfood:butter"','"rubenfood:butter"'},
	}
})





