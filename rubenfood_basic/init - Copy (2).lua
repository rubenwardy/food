-- This file registers all the foods

print ("RubenFood: Loading basic foods")


--------------------------Apple Juice--------------------------
minetest.register_node(":rubenfood:apple_juice", {
	description = "Apple Juice",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_juice_apple.png"},
	inventory_image = "ruben_juice_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '":rubenfood:apple_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:apple"','""'},
		{'""','"bucket:bucket_water"','""'},
	}
})





----------------------------Cigerete----------------------------
minetest.register_node(":rubenfood:cigarette", {
	description = "Cigarette",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_cigar.png"},
	inventory_image = "ruben_cigar.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(-4),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"rubenfood:cigarette" 1',
	recipe = {
		{'"default:dry_shrub"','"default:dry_shrub"','"default:dry_shrub"'},

	}
})





-----------------------------Coffee-----------------------------

minetest.register_craftitem(":rubenfood:coffeebean",{
	description = "Coffee Bean",
	tiles = {"ruben_coffee.png"},
	inventory_image = "ruben_coffee.png",
})

minetest.register_craftitem(":rubenfood:coffeebean_cooked",{
	description = "Cooked Coffee Bean",
	tiles = {"ruben_coffee_cooked.png"},
	inventory_image = "ruben_coffee_cooked.png",
})

minetest.register_node(":rubenfood:coffee", {
	description = "Coffee",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_coffee_cup.png"},
	inventory_image = "ruben_coffee_cup.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(10),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"rubenfood:coffeebean" 1',
	recipe = {
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
	}
})

minetest.register_craft({
	output = '"rubenfood:coffee" 1',
	recipe = {
		{'""','"rubenfood:coffeebean_cooked"','""'},
		{'""','"rubenfood:coffeebean_cooked"','""'},
		{'""','"bucket:bucket_water"','""'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:coffeebean_cooked",
	recipe = "rubenfood:coffeebean",
})