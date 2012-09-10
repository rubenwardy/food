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

minetest.register_craftitem("food:butter", {
	description = "Butter",
	inventory_image = "food_butter.png",
})

minetest.register_craftitem("food:cheese", {
	description = "Cheese",
	inventory_image = "food_cheese.png",
	on_use = minetest.item_eat(4),
})


minetest.register_craft({
	output = '"food:butter" 1',
	recipe = {
	         {'"food:milk"','"food:milk"'},
	}
})

minetest.register_craft({
	output = '"food:cheese" 1',
	recipe = {
	         {'"food:butter"','"food:butter"'},
	}
})


--
--
-- CHOCOLATE
--
--


minetest.register_craftitem("food:chocolate_dark", {
	description = "Dark Chocolate",
	inventory_image = "food_choco_dark.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("food:chocolate_milk", {
	description = "Milk Chocolate",
	inventory_image = "food_choco_milk.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("food:chocolate_powder", {
	description = "Chocolate Powder",
	inventory_image = "food_choco_powder.png",
})

minetest.register_craft({
	output = '"food:chocolate_dark" 1',
	recipe = {
	         {'"food:cocoa"','"food:cocoa"','"food:cocoa"'},
	}
})

minetest.register_craft({
	output = '"food:chocolate_powder" 1',
	recipe = {
                 {"food:cocoa","food:cocoa","food:cocoa"},
	         {"food:cocoa","food:cocoa","food:cocoa"},
	         {"food:cocoa","food:cocoa","food:cocoa"},
	}
})

minetest.register_craft({
	output = '"food:chocolate_milk" 1',
	recipe = {
	         {"","food:milk",""},
	         {"food:cocoa","food:cocoa","food:cocoa"},
	}
})

minetest.register_craft({
	output = '"food:chocolate_milk" 1',
	recipe = {
	         {"","food:milk","food:chocolate_dark"},
	}
})





