-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/init.lua
-- inits the mod
-- =====================================
-- [regis-item] Cup
-- [craft] Cup
-- [regis-food] Cigerette (-4)
-- =====================================

print ("RubenFood: Loading mainframe: [Master]")

----------------------Load Files-----------------------------
dofile(minetest.get_modpath("rubenfood").."/support.lua")
dofile(minetest.get_modpath("rubenfood").."/dairy.lua")

dofile(minetest.get_modpath("rubenfood").."/baking.lua")
dofile(minetest.get_modpath("rubenfood").."/cakes.lua")

dofile(minetest.get_modpath("rubenfood").."/drinks.lua")
dofile(minetest.get_modpath("rubenfood").."/fruits.lua")



----------------------------Cup------------------------------

minetest.register_craftitem("rubenfood:mug",{
	description = "Mug",
	tiles = {"ruben_mug.png"},
	inventory_image = "ruben_mug.png",
})

minetest.register_craft({
	output = '"rubenfood:cup" 4',
	recipe = {
		{"default:glass"},
		{"default:glass"},
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