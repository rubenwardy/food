-- FOOD MOD
-- A mod written by rubenwardy and 
-- modified by Zaraki98 that adds
-- food to the minetest game
-- =====================================
-- >> food/init.lua
-- The support api for the mod, and some
-- basic foods
-- =====================================

food = { supported={} }
function food.support(group,mod,item)
	if not minetest.get_modpath(mod) then
		print("'"..mod.."' is not installed")
		return
	end

	local mtype = "item"

	if minetest.registered_nodes[item] then
		mtype = "node"
	end

	local data = minetest.registered_items[item]

	if not data then
		print(item.." not found")
		return
	end

	data.groups["food_"..group]=1

	if mtype == "item" then
		minetest.register_craftitem(":"..item,data)
	else
		minetest.register_node(":"..item,data)
	end
	food.supported[group] = true	
end
function food.asupport(group,add)
	if food.supported[group] then
		return
	end

	for name, def in pairs(minetest.registered_items) do
		local g = def.groups and def.groups[group] or 0
		if g > 0 then
			return
		end
	end

	print("registering "..group.." inbuilt definition")
 
	add()
end
function food.item_eat(amt)
	if minetest.get_modpath("hud") then
		return hud.item_eat(hunger_change)
	else
		return minetest.item_eat(amt)
	end
end

-- Add support for other mods
food.support("wheat","farming","farming:wheat")
food.support("flour","farming","farming:flour")
food.support("tomato","farming_plus","farming_plus:tomato_item")
food.support("tomato","plantlib","plantlib:tomato")
food.support("strawberry","farming_plus","farming_plus:strawberry_item")
food.support("strawberry","plantlib","plantlib:strawberry")
food.support("carrot","farming_plus","farming_plus:carrot_item")
food.support("carrot","docfarming","docfarming:carrot")
food.support("carrot","plantlib","plantlib:carrot")
food.support("cocoa","farming_plus","farming_plus:cocoa_bean")
food.support("milk","animalmaterials","animalmaterials:milk")
food.support("milk","my_mobs","my_mobs:milk_glass_cup")
food.support("egg","animalmaterials","animalmaterials:egg")
--food.support("meat_raw","mobs","mobs:meat_raw")
food.support("meat_raw","animalmaterials","animalmaterials:meat_raw")
food.support("meat","mobs","mobs:meat")
food.support("banana","farming_plus","farming_plus:banana")
food.support("bread","farming","farming:bread")
food.support("rhubarb","farming_plus","farming_plus:rhubarb_item")

-- Default inbuilt ingrediants
food.asupport("wheat",function()
	minetest.register_craftitem("food:wheat", {
		description = "Wheat",
		inventory_image = "food_wheat.png",
		groups = {food_wheat=1}
	})

	minetest.register_craft({
		output = "food:wheat",
		recipe = {
			{"default:dry_shrub"},
		}
	})
end)
food.asupport("flour",function()
	minetest.register_craftitem("food:flour", {
		description = "Flour",
		inventory_image = "food_flour.png",
		groups = {food_flour = 1}
	})
	minetest.register_craft({
		output = "food:flour",
		recipe = {
			{"group:food_wheat"},
			{"group:food_wheat"}
		}
	})
	minetest.register_craft({
		output = "food:flour",
		recipe = {
			{"default:sand"},
			{"default:sand"}
		}
	})
end)
food.asupport("tomato",function()
	minetest.register_craftitem("food:tomato", {
		description = "Tomato",
		inventory_image = "food_tomato.png",
		groups = {food_tomato = 1}
	})
	minetest.register_craft({
		output = "food:tomato",
		recipe = {
			{"", "default:desert_sand", ""},
			{"default:desert_sand", "", "default:desert_sand"},
			{"", "default:desert_sand", ""}
		}
	})
end)
food.asupport("strawberry",function()
	minetest.register_craftitem("food:strawberry", {
		description = "Strawberry",
		inventory_image = "food_strawberry.png",
		on_use = food.item_eat(2),
		groups = {food_strawberry=1}
	})
	minetest.register_craft({
		output = "food:strawberry",
		recipe = {
			{"default:apple"},
		}
	})
end)
food.asupport("carrot",function()
	minetest.register_craftitem("food:carrot", {
		description = "Carrot",
		inventory_image = "food_carrot.png",
		groups = {food_carrot=1},
		on_use = food.item_eat(3)
	})
	minetest.register_craft({
		output = "food:carrot",
		recipe = {
			{"default:apple","default:apple","default:apple"},
		}
	})
end)
food.asupport("milk",function()
	minetest.register_craftitem("food:milk", {
		description = "Milk",
		image = "food_milk.png",
		on_use = food.item_eat(1),
		groups = { eatable=1, food_milk = 1 },
		stack_max=10
	})
	minetest.register_craft({
		output = "food:milk",
		recipe = {
			{"default:sand"},
			{"bucket:bucket_water"}
		},
		replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
	})
end)
food.asupport("egg",function()
	minetest.register_craftitem("food:egg",{
		description = "Egg",
		inventory_image = "food_egg.png",
		groups = {food_egg=1}
	})
	minetest.register_craft({
		output = "food:egg",
		recipe = {
			{"", "default:sand", ""},
			{"default:sand", "", "default:sand"},
			{"", "default:sand", ""}
		}
	})
end)
food.asupport("cocoa",function()
	minetest.register_craftitem("food:cocoa", {
		description = "Cocoa Bean",
		inventory_image = "food_cocoa.png",
		groups = {food_cocoa=1}
	})
	minetest.register_craft({
		output = "food:cocoa",
		recipe = {
			{"","default:apple",""},
			{"default:apple","","default:apple"},
			{"","default:apple",""}
		}
	})
end)
food.asupport("meat_raw",function()
	minetest.register_craftitem("food:meat_raw", {
		description = "Raw meat",
		image = "food_meat_raw.png",
		on_use = food.item_eat(1),
		groups = { meat=1, eatable=1, food_meat_raw=1 },
		stack_max=25
	})
	minetest.register_craft({
		output = "food:meat_raw",
		recipe = {
			{"default:apple"},
			{"default:dirt"}
		}
	})
end)
food.asupport("food:meat",function()
	minetest.register_craftitem("food:meat", {
		description = "Venison",
		inventory_image = "food_meat.png",
		groups = {food_meat=1,food_chicken=1}
	})
	
	minetest.register_craft({
		type = "cooking",
		output = "food:meat",
		recipe = "group:food_meat_raw",
		cooktime = 30
	})
end)

-- Register sugar
minetest.register_craftitem("food:sugar", {
	description = "Sugar",
	inventory_image = "food_sugar.png",
	groups = {food_sugar=1}
})
minetest.register_craft({
	output = "food:sugar 20",
	recipe = {
		{"default:papyrus"},
	}
})

-- Register chocolate powder	
minetest.register_craftitem("food:chocolate_powder", {
	description = "Chocolate Powder",
	inventory_image = "food_chocolate_powder.png",
	groups = {food_choco_powder = 1}
})
minetest.register_craft({
	output = "food:chocolate_powder 16",
	recipe = {
		{"group:food_cocoa","group:food_cocoa","group:food_cocoa"},
		{"group:food_cocoa","group:food_cocoa","group:food_cocoa"},
		{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
	}
})

-- Register dark chocolate
minetest.register_craftitem("food:dark_chocolate",{
	description = "Dark Chocolate",
	inventory_image = "food_dark_chocolate.png",
	groups = {food_dark_chocolate=1},
	on_use = food.item_eat(2)
})
minetest.register_craft({
	output = "food:dark_chocolate",
	recipe = {
		{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
	}
})

-- Register milk chocolate
minetest.register_craftitem("food:milk_chocolate",{
	description = "Milk Chocolate",
	inventory_image = "food_milk_chocolate.png",
	groups = {food_milk_chocolate=1},
	on_use = food.item_eat(2)
})
minetest.register_craft({
	output = "food:milk_chocolate",
	recipe = {
			{"","group:food_milk",""},
			{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
	}
})

-- Register pasta
minetest.register_craftitem("food:pasta",{
	description = "Pasta",
	inventory_image = "food_pasta.png",
	groups = {food_pasta=1},
	on_use = food.item_eat(2)
})
minetest.register_craft({
	output = "food:pasta 4",
	type = "shapeless",
	recipe = {"group:food_flour","group:food_egg","group:food_egg"}
})

-- Register bowl
minetest.register_craftitem("food:bowl",{
	description = "Bowl",
	inventory_image = "food_bowl.png",
	groups = {food_bowl=1}
})
minetest.register_craft({
	output = "food:bowl",
	recipe = {
		{"default:clay_lump","","default:clay_lump"},
		{"","default:clay_lump",""}
	}
})
-- Register butter
minetest.register_craftitem("food:butter", {
	description = "Butter",
	inventory_image = "food_butter.png",
	groups = {food_butter=1}
})
minetest.register_craft({
	output = "food:butter",
	recipe = {
		{"group:food_milk","group:food_milk"},
	}
})

-- Register cheese
minetest.register_craftitem("food:cheese", {
	description = "Cheese",
	inventory_image = "food_cheese.png",
	on_use = food.item_eat(2),
	groups = {food_cheese=1}
})
minetest.register_craft({
	output = "food:cheese",
	recipe = {
		{"group:food_butter","group:food_butter"},
	}
})

-- Register pasta bake
minetest.register_craftitem("food:pasta_bake",{
	description = "Pasta Bake",
	inventory_image = "food_pasta_bake.png",
	on_use = food.item_eat(4),
	groups = {food=3}
})
minetest.register_craftitem("food:pasta_bake_raw",{
	description = "Raw Pasta Bake",
	inventory_image = "food_pasta_bake_raw.png",
	groups={food=2}
})
minetest.register_craft({
	output = "food:pasta_bake",
	type = "cooking",
 	recipe = "food:pasta_bake_raw"
})
minetest.register_craft({
	output = "food:pasta_bake_raw",
 	recipe = {
		{"group:food_cheese"},
		{"group:food_pasta"},
		{"group:food_bowl"}
	}
})

-- Soups
local soups = {"tomato","chicken"}
for i=1, #soups do
	local flav = soups[i]
	minetest.register_craftitem("food:soup_"..flav,{
		description = flav.." Soup",
		inventory_image = "food_soup_"..flav..".png",
		on_use = food.item_eat(4),
		groups = {food=3}
	})
	minetest.register_craftitem("food:soup_"..flav.."_raw",{
		description = "Uncooked ".. flav.." Soup",
		inventory_image = "food_soup_"..flav.."_raw.png",
		groups={food=2}
	
	})
	minetest.register_craft({
		type = "cooking",
		output = "food:soup_"..flav,
		recipe = "food:soup_"..flav.."_raw",
	})
	minetest.register_craft({
		output = "food:soup_"..flav.."_raw",
		recipe = {
	        	{"", "", ""},
	        	{"bucket:bucket_water", "group:food_"..flav, "bucket:bucket_water"},
			{"", "group:food_bowl", ""},
	        },
		replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"bucket:bucket_water", "bucket:bucket_empty"}}
	})
end

-- Register cakes
minetest.register_node("food:cake", {
	description = "Cake",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_texture.png",
		"food_cake_texture.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png"
	},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502}, --NodeBox 1
			{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000}, --NodeBox 2
			{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}, --NodeBox 3
		}
	}
})
minetest.register_node("food:cake_choco", {
	description = "Chocolate Cake",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_choco_texture.png",
		"food_cake_choco_texture.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png"
	},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502}, --NodeBox 1
			{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000}, --NodeBox 2
			{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}, --NodeBox 3
		}
	}
})
minetest.register_node("food:cake_carrot", {
	description = "Carrot Cake",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3},
	walkable = false,
	sunlight_propagates = true,
	tiles = {
		"food_cake_carrot_texture.png",
		"food_cake_carrot_texture.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png"
	},
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502}, --NodeBox 1
			{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000}, --NodeBox 2
			{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}, --NodeBox 3
		}
	}
})
minetest.register_craftitem("food:cake_cheese",{
	description = "Cheese cake",
	inventory_image = "food_cake_cheese.png",
	on_use = food.item_eat(4),
	groups={food=3,crumbly=3}
})
minetest.register_craft({
	type = "cooking",
	output = "food:cake",
	recipe = "food:cakemix_plain",
	cooktime = 10,
})
minetest.register_craft({
	type = "cooking",
	output = "food:cake_choco",
	recipe = "food:cakemix_choco",
	cooktime = 10,
})
minetest.register_craft({
	type = "cooking",
	output = "food:cake_carrot",
	recipe = "food:cakemix_carrot",
	cooktime = 10,
})
minetest.register_craft({
	type = "cooking",
	output = "food:cake_cheese",
	recipe = "food:cakemix_cheese",
	cooktime = 10,
})

-- Cake mix
minetest.register_craftitem("food:cakemix_plain",{
	description = "Cake Mix",
	inventory_image = "food_cakemix_plain.png",
	groups={food=2}
})

minetest.register_craftitem("food:cakemix_choco",{
	description = "Chocolate Cake Mix",
	inventory_image = "food_cakemix_choco.png",
	groups={food=2}
})

minetest.register_craftitem("food:cakemix_carrot",{
	description = "Carrot Cake Mix",
	inventory_image = "food_cakemix_carrot.png",
	groups={food=2}
})

minetest.register_craftitem("food:cakemix_cheese",{
	description = "Cheese Cake Mix",
	inventory_image = "food_cakemix_carrot.png",
	groups={food=2}
})
minetest.register_craft({
	output = "food:cakemix_plain",
	recipe = {
		{"group:food_flour","group:food_sugar","group:food_egg"},
	}
})
minetest.register_craft({
	output = "food:cakemix_choco",
	recipe = {
		{"","group:food_choco_powder",""},
		{"group:food_flour","group:food_sugar","group:food_egg"},
	}
})
minetest.register_craft({
	output = "food:cakemix_carrot",
	recipe = {
		{"","group:food_carrot",""},
		{"group:food_flour","group:food_sugar","group:food_egg"},
	}
})
minetest.register_craft({
	output = "food:cakemix_cheese",
	recipe = {
		{"group:food_cheese","group:food_strawberry",""},
		{"group:food_flour","group:food_sugar","group:food_egg"},
	}
})

-- Milkshakes
minetest.register_craftitem("food:ms_chocolate", {
	description = "Chocolate Milkshake",
	inventory_image = "food_ms_chocolate.png",
	on_use = minetest.item_eat(4),
	groups={food_ms_chocolate=1}
})

minetest.register_craft({
output = "food:ms_chocolate",
recipe = {
{"food:milk_chocolate"},
{"vessels:drinking_glass"},
},
})

minetest.register_craftitem("food:ms_strawberry", {
	description = "Strawberry Milkshake",
	inventory_image = "food_ms_strawberry.png",
	on_use = minetest.item_eat(4),
	groups={food_ms_strawberry=1}
})

minetest.register_craft({
output = "food:ms_strawberry",
recipe = {
{"group:food_strawberry"},
{"vessels:drinking_glass"},
},
})

minetest.register_craftitem("food:ms_banana", {
	description = "Banana Milkshake",
	inventory_image = "food_ms_banana.png",
	on_use = minetest.item_eat(4),
	groups={food_ms_banana=1}
})

food.asupport("banana",function()
	minetest.register_craftitem("food:banana", {
		description = "Banana",
		inventory_image = "food_banana.png",
		groups = {food_banana=1}
})
end)

minetest.register_craft({
output = "food:ms_banana",
recipe = {
{"group:food_banana"},
{"vessels:drinking_glass"},
},
})

--Mug
minetest.register_craftitem("food:mug",{
	description = "Mug",
	inventory_image = "food_mug.png",
	groups={food_mug=1}
})

minetest.register_craftitem("food:clay_mug",{
	description = "Clay Mug",
	inventory_image = "food_clay_mug.png",
	groups={food_clay_mug=1}
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

-- Hot choco
minetest.register_craftitem("food:hotchoco", {
	description = "Hot Chocolate",
	inventory_image = "food_hotchoco.png",
	on_use = minetest.item_eat(4),
	groups={food_hot_choco=1}
})

minetest.register_craft({
	output = '"food:hotchoco" 1 ',
	recipe = {
		{"group:food_choco_powder"},
		{"group:food_milk"},
		{"food:mug"},
	},
})

--Coffee
minetest.register_craftitem("food:coffeebean",{
	description = "Raw Coffee Bean",
	tiles = {"food_coffee.png"},
	inventory_image = "food_coffee.png",
	groups={food=2}
})

minetest.register_craftitem("food:coffeebean_cooked",{
	description = "Cooked Coffee Bean",
	tiles = {"food_coffee_cooked.png"},
	inventory_image = "food_coffee_cooked.png",
	groups={food=2}
})

minetest.register_craftitem("food:coffee", {
	description = "Coffee",
	inventory_image = "food_coffee_cup.png",
	on_use = minetest.item_eat(10),
	groups={food_coffee=1}
})

minetest.register_craft({
	output = '"food:coffeebean" 1',
	recipe = {
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
	}
})

minetest.register_craft({
	output = '"food:coffee" 1',
	recipe = {
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:mug"','""'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:coffeebean_cooked",
	recipe = "food:coffeebean",
})

--Bread & Bread Slices
food.asupport("bread",function()
	minetest.register_craftitem("food:bread", {
		description = "Bread",
		inventory_image = "food_bread.png",
		groups = {food_bread=1}
})
end)

minetest.register_craftitem("food:bread_slice", {
	description = "Bread Slice",
	inventory_image = "food_bread_slice.png",
	on_use = minetest.item_eat(2),
	groups={food_bread_slice=1}
})

minetest.register_craft({
	output = '"food:bread_slice" 10',
	recipe = {
		{'"group:food_bread"'},
	},
})

--Sandwich
minetest.register_craftitem("food:sw_meat", {
	description = "Venison Sandwich",
	inventory_image = "food_sw_meat.png",
	on_use = minetest.item_eat(10),
	groups={food=2},
})

minetest.register_craftitem("food:sw_cheese", {
	description = "Cheese Sandwich",
	inventory_image = "food_sw_cheese.png",
	on_use = minetest.item_eat(8),
	groups={food=2},
})

minetest.register_craft({
	output = '"food:sw_meat" 1',
	recipe = {
        {"",'"food:bread_slice"',""},
		{"group:food_butter","group:food_meat",'"group:food_butter"'},
		{"",'"food:bread_slice"',""},
	}
})

minetest.register_craft({
	output = '"food:sw_cheese" 1',
	recipe = {
                 {"",'"food:bread_slice"',""},
		{"group:food_butter","group:food_cheese",'"group:food_butter"'},
		{"",'"food:bread_slice"',""},
	}
})

--Rhubarb
food.asupport("rhubarb",function()
	minetest.register_craftitem("food:rhubarb", {
		description = "Rhubarb",
		inventory_image = "food_rhubarb.png",
		groups = {food_rhubarb=1}
})
end)

--Crumbles
minetest.register_craftitem("food:crumble_rhubarb", {
	description = "Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb.png",
	on_use = minetest.item_eat(30),
	groups={food_crumble=1}
})

minetest.register_craftitem("food:crumble_rhubarb_raw", {
	description = "Raw Rhubarb Crumble",
	inventory_image = "food_crumble_rhubarb_raw.png",
	groups={food_crumble_raw=1}
})

minetest.register_craft({
	output = '"food:crumble_rhubarb_raw" 1',
	recipe = {
	{'"group:food_sugar"',"",""},
	{'"group:food_flour"','"group:food_rhubarb"','"group:food_butter"'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:crumble_rhubarb",
	recipe = "food:crumble_rhubarb_raw",
})

-- Banana Split & Popcorn
minetest.register_craftitem("food:banana_split_raw", {
	description = "Banana Split Raw",
	inventory_image = "food_banana_split_raw.png",
	groups={food_banana_split_raw=1}
})

minetest.register_craftitem("food:banana_split", {
	description = "Banana Split",
	inventory_image = "food_banana_split.png",
	on_use = minetest.item_eat(3),
	groups={food_banana_split=1}
})

minetest.register_craftitem("food:popcorn", {
	description = "Popcorn",
	inventory_image = "food_popcorn.png",
	on_use = minetest.item_eat(1),
	groups={food_popcorn=1}
})

minetest.register_craftitem("food:corn_seed", {
	description = "Corn Pips",
	inventory_image = "food_corn_pip.png",
	groups={food_corn_seed=1}
})

minetest.register_craft({
	type = "cooking",
	output = "food:popcorn",
	recipe = "food:corn_seed",
})

minetest.register_craft({
	output = "food:corn_seed",
	recipe = {{"farming:seed_wheat"},
	},
})

minetest.register_craft({
	output = "food:banana_split_raw",
	recipe = {
		{"group:food_milk_chocolate"},
		{"group:food_banana"},
	},
})
minetest.register_craft({
	type = "cooking",
	output = "food:banana_split",
	recipe = "food:banana_split_raw",
})

--Tarts
minetest.register_craftitem("food:tart_strawberry", {
	description = "Strawberry Tart",
	inventory_image = "food_tart_strawberry.png",
	on_use = minetest.item_eat(30),
	groups={food_tart_strawberry=1}
})

minetest.register_craftitem("food:tart_base", {
	description = "Tart Base",
	inventory_image = "food_tart_base.png",
	groups={food_tart_base=1}
})

minetest.register_craftitem("food:tart_base_raw", {
	description = "Raw Tart Base",
	inventory_image = "food_tart_base_raw.png",
	groups={food_tart_base_raw=1}
})

minetest.register_craft({
	type = "cooking",
	output = "food:tart_base",
	recipe = "food:tart_base_raw",
})

minetest.register_craft({
	output = '"food:tart_strawberry" 1',
	recipe = {
	         {'"group:food_strawberry"'},
			 {'"food:tart_base"'},
	}
})

minetest.register_craft({
	output = '"food:tart_base_raw" 1',
	recipe = {
	         {'"group:food_flour"','"group:food_milk"','"group:food_egg"'},
	}
})

