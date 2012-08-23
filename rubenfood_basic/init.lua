-- This file registers all the foods

print ("RubenFood: Loading mainframe")

----------------------------Cup------------------------------
minetest.register_craftitem(":rubenfood:cup",{
	description = "Cup",
	tiles = {"ruben_coffee.png"},
	inventory_image = "ruben_coffee.png",
})

minetest.register_craft({
	output = '"rubenfood:cup" 4',
	recipe = {
		{'"bucket:bucket_water"'},
	}
})


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
	output = '"rubenfood:apple_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:apple"','""'},
		{'""','"rubenfood:cup"','""'},
	}
})








----------------------cactuz juice----------------------------
minetest.register_node(":rubenfood:cactus_juice", {
	description = "Cactuz Juice",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_juice_cactus.png"},
	inventory_image = "ruben_juice_cactus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"rubenfood:cactus_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:cactus"','""'},
		{'""','"rubenfood:cup"','""'},
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
	description = "Raw Coffee Bean",
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
		{'""','"rubenfood:cup"','""'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:coffeebean_cooked",
	recipe = "rubenfood:coffeebean",
})






--------------------------Cakes-------------------------
minetest.register_craftitem(":rubenfood:cakemix_plain",{
	description = "Cake Mix",
	tiles = {"ruben_pastry.png"},
	inventory_image = "ruben_pastry.png",
})

minetest.register_craftitem(":rubenfood:cakemix_choco",{
	description = "Chocolate Cake Mix",
	tiles = {"ruben_pastry_choco.png"},
	inventory_image = "ruben_pastry_choco.png",
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:cake",
	recipe = "rubenfood:cakemix_plain",
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:cake_chocolate",
	recipe = "rubenfood:cakemix_choco",
})

minetest.register_node(":rubenfood:cake", {
	description = "Cake",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_cake.png"},
	inventory_image = "ruben_cake.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(30),
	sounds = default.node_sound_defaults(),
})

minetest.register_node(":rubenfood:cake_chocolate", {
	description = "Chocolate Cake",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_cake_choco.png"},
	inventory_image = "ruben_cake_choco.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(40),
	sounds = default.node_sound_defaults(),
})



print("Rubenfood: Mainframe loaded")