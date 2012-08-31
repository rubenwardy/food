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

print ("food: Loading mainframe: [Master]")

----------------------Load Files-----------------------------
dofile(minetest.get_modpath("food").."/support.lua")
dofile(minetest.get_modpath("food").."/dairy.lua")

dofile(minetest.get_modpath("food").."/baking.lua")
dofile(minetest.get_modpath("food").."/cakes.lua")
dofile(minetest.get_modpath("food").."/tarts.lua")

dofile(minetest.get_modpath("food").."/drinks.lua")
--dofile(minetest.get_modpath("food").."/fruits.lua")



----------------------------Cup------------------------------

minetest.register_craftitem("food:mug",{
	description = "Mug",
	tiles = {"food_mug.png"},
	inventory_image = "food_mug.png",
})

minetest.register_craft({
	output = '"food:cup" 4',
	recipe = {
		{"default:glass"},
		{"default:glass"},
	}
})


----------------------------Cigerete----------------------------
minetest.register_node(":food:cigarette", {
	description = "Cigarette",
	visual_scale = 1.0,
	tiles = {"food_cigar.png"},
	inventory_image = "food_cigar.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(-4),
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = '"food:cigarette" 1',
	recipe = {
		{'"default:dry_shrub"','"default:dry_shrub"','"default:dry_shrub"'},

	}
})

print("food: Mainframe loaded")