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

print("Rubenfood: Mainframe loaded")