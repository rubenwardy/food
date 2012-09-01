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
dofile(minetest.get_modpath("food").."/oven.lua")

dofile(minetest.get_modpath("food").."/dairy.lua")
dofile(minetest.get_modpath("food").."/meats.lua")
dofile(minetest.get_modpath("food").."/sandwich.lua")
dofile(minetest.get_modpath("food").."/baking.lua")

dofile(minetest.get_modpath("food").."/crumbles.lua")
dofile(minetest.get_modpath("food").."/cakes.lua")
dofile(minetest.get_modpath("food").."/tarts.lua")

dofile(minetest.get_modpath("food").."/drinks.lua")



----------------------------Cup------------------------------

minetest.register_craftitem("food:mug",{
	description = "Mug",
	inventory_image = "food_mug.png",
})

minetest.register_craft({
	output = '"food:cup" 4',
	recipe = {
		{"default:glass"},
		{"default:glass"},
	}
})

-----------------------------Sugar------------------------------
minetest.register_craftitem("food:sugar", {
	description = "Sugar",
	inventory_image = "food_sugar.png",
})
minetest.register_craft({
	output = '"food:sugar" 20',
	recipe = {
		{'"default:papyrus"'},

	}
})

----------------------------Cigerete----------------------------
minetest.register_node(":food:cigarette", {
	description = "Cigarette",
	inventory_image = "food_cigar.png",
	on_use = minetest.item_eat(-4),
})

minetest.register_craft({
	output = '"food:cigarette" 1',
	recipe = {
		{'"default:dry_shrub"','"default:dry_shrub"','"default:dry_shrub"'},

	}
})

print("food: Mainframe loaded")