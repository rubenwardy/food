print("RubenFood [Master] - Loading Cakes")

dofile(minetest.get_modpath("rubenfood").."/cakemix.lua")
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