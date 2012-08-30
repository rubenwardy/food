-- This file adds apple like fruits

print ("RubenFood [Master] - Loading Fruits")

minetest.register_node(":default:orange", {
	description = "Orange Fruit",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ruben_orange.png"},
	inventory_image = "ruben_orange.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(4),
	sounds = default.node_sound_defaults(),
})