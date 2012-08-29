-- This file registers all the foods

-- Apple Juice
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
		{'""','"bucket:bucket_water"','""'},
	}
})





-- Cigerete
minetest.register_node("rubenfood:cigarette", {
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





--Coffee
minetest.register_node("rubenfood:coffee", {
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
	output = '"rubenfood:coffee" 1',
	recipe = {
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
		{'""','"bucket:bucket_water"','""'},
	}
})