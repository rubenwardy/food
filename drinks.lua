-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/drinks.lua
-- adds drinks
-- =====================================
-- [regis-food] Apple Juice
-- [craft] Cactus Juice
-- [regis-food] Cactus Juice
-- [craft] Cactus Juice
-- =====================================

print ("RubenFood [Master] - Loading Juices")

--------------------------Apple Juice--------------------------
minetest.register_node("food:apple_juice", {
	description = "Apple Juice",
	
	visual_scale = 1.0,
	tiles = {"food_juice_apple.png"},
	inventory_image = "food_juice_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"food:apple_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:apple"','""'},
		{'""','"food:cup"','""'},
	}
})





----------------------cactus juice----------------------------
minetest.register_node(":food:cactus_juice", {
	description = "Cactuz Juice",
	
	visual_scale = 1.0,
	tiles = {"food_juice_cactus.png"},
	inventory_image = "food_juice_cactus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"food:cactus_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:cactus"','""'},
		{'""','"food:cup"','""'},
	}
})










-----------------------------Coffee-----------------------------

minetest.register_craftitem(":food:coffeebean",{
	description = "Raw Coffee Bean",
	tiles = {"food_coffee.png"},
	inventory_image = "food_coffee.png",
})

minetest.register_craftitem(":food:coffeebean_cooked",{
	description = "Cooked Coffee Bean",
	tiles = {"food_coffee_cooked.png"},
	inventory_image = "food_coffee_cooked.png",
})

minetest.register_node(":food:coffee", {
	description = "Coffee",

	visual_scale = 1.0,
	tiles = {"food_coffee_cup.png"},
	inventory_image = "food_coffee_cup.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(10),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"food:coffeebean" 1',
	recipe = {
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
	}
})

minetest.register_craft({
	output = '"food:coffee" 1',
	recipe = {
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:cup"','""'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:coffeebean_cooked",
	recipe = "food:coffeebean",
})




