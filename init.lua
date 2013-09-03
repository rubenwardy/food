-- RUBENFOOD MOD
-- A mod written by rubenwardy and helped
-- by Zaraki98 that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/init.lua
-- inits the mod
-- =====================================
-- [regis-item] Cup
-- [craft] Cup
-- [regis-food] Cigerette (-4)
-- =====================================

print ("Food: Loading mainframe: [Master]")

----------------------Load Files-----------------------------
dofile(minetest.get_modpath("food").."/support.lua")

dofile(minetest.get_modpath("food").."/dairy.lua")
dofile(minetest.get_modpath("food").."/food/meats.lua")
dofile(minetest.get_modpath("food").."/food/sandwich.lua")
dofile(minetest.get_modpath("food").."/food/baking.lua")
dofile(minetest.get_modpath("food").."/food/soup.lua")

dofile(minetest.get_modpath("food").."/snacks/crumbles.lua")
dofile(minetest.get_modpath("food").."/snacks/cakes.lua")
dofile(minetest.get_modpath("food").."/snacks/tarts.lua")
dofile(minetest.get_modpath("food").."/snacks/misc.lua")

dofile(minetest.get_modpath("food").."/drinks/juice.lua")
dofile(minetest.get_modpath("food").."/drinks/hot.lua")
dofile(minetest.get_modpath("food").."/drinks/milkshakes.lua")


----------------------------Cup------------------------------

minetest.register_craftitem("food:mug",{
	description = "Mug",
	inventory_image = "food_mug.png",
})

minetest.register_craftitem("food:clay_mug",{
	description = "Clay Mug",
	inventory_image = "food_clay_mug.png",
})

minetest.register_craft({
	output = '"food:clay_mug" 1',
	recipe = {
		{"default:clay_lump","","default:clay_lump"},
		{"default:clay_lump","","default:clay_lump"},
		{"default:clay_lump","default:clay_lump","default:clay_lump"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:mug",
	recipe = "food:clay_mug",
})

-----------------------------Bowl-------------------------------

minetest.register_craftitem("food:bowl",{
	description = "Bowl",
	inventory_image = "food_bowl.png",
})

minetest.register_craft({
	output = "food:bowl",
	recipe = {
		{"default:stone","","default:stone"},
		{"","default:stone",""},
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

--------------------------Cactus Slice--------------------------
minetest.register_craftitem("food:cactus_slice", {
	description = "Cactus Slice",
	inventory_image = "food_cactus_slice.png",
	on_use = minetest.item_eat(2),
})
minetest.register_craft({
	output = '"food:cactus_slice" 4',
	recipe = {
		{'"default:cactus"'},

	}
})

----------------------------Cigarete----------------------------
minetest.register_craftitem("food:cigarette", {
	description = "Cigarette",
	inventory_image = "food_cigar.png",
	on_use = minetest.item_eat(-4),
})

minetest.register_craft({
	output = "food:cigarette",
	recipe = {
		{'"default:dry_shrub"','"default:dry_shrub"','"default:dry_shrub"'},

	}
})


print("Food: Mainframe loaded")
