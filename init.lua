-- FOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> food/init.lua
-- The support api for the mod, and some
-- basic foods
-- =====================================

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
  dofile(minetest.get_modpath("intllib").."/intllib.lua")
  S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

food = {
	supported = {},
	atsup = {},
	df = {},
	debug = false
}

function food.support(group,mod,item)
	food.atsup[group] = true
	if not minetest.get_modpath(mod) then
		print("mod '"..mod.."' is not installed")
		return
	end

	local mtype = "item"

	if minetest.registered_nodes[item] then
		mtype = "node"
	end

	local data = minetest.registered_items[item]

	if not data then
		print("item '"..item.."' not found")
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
	food.df[group] = true
	if food.supported[group] then
		return
	end

	for name, def in pairs(minetest.registered_items) do
		local g = def.groups and def.groups["food_"..group] or 0
		if g > 0 then
			return
		end
	end

	print("registering "..group.." inbuilt definition")
 
	add()
end
function food.item_eat(amt)
	if minetest.get_modpath("hud") then
		return hud.item_eat(amt)
	else
		return minetest.item_eat(amt)
	end
end

-- Debug to check all supports have inbuilt
if food.debug then
minetest.after(0, function()
	for name, val in pairs(food.atsup) do
		if not food.df[name] then
			print("[FOOD DEBUG] Ingredient "..name.." has no built in equiv")
		
		end
	end
	
	for name, val in pairs(food.df) do
		if not food.atsup[name] then
			print("[FOOD DEBUG] Inbuilt ingredient "..name.." has no supported external equiv")

		end
	end
end)
end

-- Add support for other mods
food.support("wheat","farming","farming:wheat")
food.support("flour","farming","farming:flour")
food.support("potato","docfarming","docfarming:potato")
food.support("potato","veggies","veggies:potato")
food.support("potato","farming_plus","farming_plus:potato_item")
food.support("tomato","farming_plus","farming_plus:tomato_item")
food.support("tomato","plantlib","plantlib:tomato")
food.support("strawberry","farming_plus","farming_plus:strawberry_item")
food.support("strawberry","plantlib","plantlib:strawberry")
food.support("carrot","farming_plus","farming_plus:carrot_item")
food.support("carrot","docfarming","docfarming:carrot")
food.support("carrot","plantlib","plantlib:carrot")
food.support("carrot","jkfarming","jkfarming:carrot")
food.support("cocoa","farming_plus","farming_plus:cocoa_bean")
food.support("milk","animalmaterials","animalmaterials:milk")
food.support("milk","my_mobs","my_mobs:milk_glass_cup")
food.support("milk","jkanimals","jkanimals:bucket_milk")
food.support("egg","animalmaterials","animalmaterials:egg")
food.support("egg","jkanimals","jkanimals:egg")
food.support("meat_raw","animalmaterials","animalmaterials:meat_raw")
food.support("meat","mobs","mobs:meat")
food.support("meat","jkanimals","jkanimals:meat")
food.support("cup","vessels","vessels:drinking_glass")
food.support("cup","animalmaterials","animalmaterials:glass")
food.support("sugar","jkfarming","jkfarming:sugar")
food.support("sugar","bushes_classic","bushes:sugar")

-- Default inbuilt ingrediants
food.asupport("wheat",function()
	minetest.register_craftitem("food:wheat", {
		description = S("Wheat"),
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
		description = S("Flour"),
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
food.asupport("potato",function()
	minetest.register_craftitem("food:potato", {
		description = S("Potato"),
		inventory_image = "food_potato.png",
		groups = {food_potato = 1}
	})
	minetest.register_craft({
		output = "food:potato",
		recipe = {
			{"default:dirt"},
			{"default:apple"}

		}
	})
end)
food.asupport("tomato",function()
	minetest.register_craftitem("food:tomato", {
		description = S("Tomato"),
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
		description = S("Strawberry"),
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
		description = S("Carrot"),
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
		description = S("Milk"),
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
		description = S("Egg"),
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
		description = S("Cocoa Bean"),
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
		description = S("Raw meat"),
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
food.asupport("meat",function()
	minetest.register_craftitem("food:meat", {
		description = S("Venison"),
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

if minetest.get_modpath("animalmaterials") then
	minetest.register_craft({
		type = "cooking",
		output = "food:meat",
		recipe = "group:food_meat_raw",
		cooktime = 30
	})

end

-- Register sugar
minetest.register_craftitem("food:sugar", {
	description = S("Sugar"),
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
	description = S("Chocolate Powder"),
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
	description = S("Dark Chocolate"),
	inventory_image = "food_dark_chocolate.png",
	groups = {food_dark_chocolate=1}
})
minetest.register_craft({
	output = "food:dark_chocolate",
	recipe = {
		{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
	}
})

-- Register milk chocolate
minetest.register_craftitem("food:milk_chocolate",{
	description = S("Milk Chocolate"),
	inventory_image = "food_milk_chocolate.png",
	groups = {food_milk_chocolate=1}
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
	description = S("Pasta"),
	inventory_image = "food_pasta.png",
	groups = {food_pasta=1}
})
minetest.register_craft({
	output = "food:pasta 4",
	type = "shapeless",
	recipe = {"group:food_flour","group:food_egg","group:food_egg"}
})

-- Register bowl
minetest.register_craftitem("food:bowl",{
	description = S("Bowl"),
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
	description = S("Butter"),
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
	description = S("Cheese"),
	inventory_image = "food_cheese.png",
	on_use = food.item_eat(4),
	groups = {food_cheese=1}
})
minetest.register_craft({
	output = "food:cheese",
	recipe = {
		{"group:food_butter","group:food_butter"},
	}
})

-- Register baked potato
minetest.register_craftitem("food:baked_potato", {
	description = S("Baked Potato"),
	inventory_image = "food_baked_potato.png",
	on_use = food.item_eat(6),
})
minetest.register_craft({
	type = "cooking",
	output = "food:baked_potato",
	recipe = "group:food_potato",
})

-- Register pasta bake
minetest.register_craftitem("food:pasta_bake",{
	description = S("Pasta Bake"),
	inventory_image = "food_pasta_bake.png",
	on_use = food.item_eat(4),
	groups = {food=3}
})
minetest.register_craftitem("food:pasta_bake_raw",{
	description = S("Raw Pasta Bake"),
	inventory_image = "food_pasta_bake_raw.png",
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

-- Register Soups
local soups = {
	{"tomato","tomato"},
	{"chicken","meat"}
}
for i=1, #soups do
	local flav = soups[i]
	minetest.register_craftitem("food:soup_"..flav[1],{
		description = S(flav[1].." Soup"),
		inventory_image = "food_soup_"..flav[1]..".png",
		on_use = food.item_eat(4),
		groups = {food=3}
	})
	minetest.register_craftitem("food:soup_"..flav[1].."_raw",{
		description = S("Uncooked ".. flav[1].." Soup"),
		inventory_image = "food_soup_"..flav[1].."_raw.png",
	
	})
	minetest.register_craft({
		type = "cooking",
		output = "food:soup_"..flav[1],
		recipe = "food:soup_"..flav[1].."_raw",
	})
	minetest.register_craft({
		output = "food:soup_"..flav[1].."_raw",
		recipe = {
	        	{"", "", ""},
	        	{"bucket:bucket_water", "group:food_"..flav[2], "bucket:bucket_water"},
			{"", "group:food_bowl", ""},
	        },
		replacements = {{"bucket:bucket_water", "bucket:bucket_empty"},{"bucket:bucket_water", "bucket:bucket_empty"}}
	})
end

-- Juices
local juices = {"apple","cactus"}
for i=1, #juices do
	local flav = juices[i]
	minetest.register_craftitem("food:"..flav.."_juice", {
		description = S(flav.." Juice"),
		inventory_image = "food_"..flav.."_juice.png",
		on_use = minetest.item_eat(2),
	})
		
	minetest.register_craft({
		output = "food:"..flav.."_juice 4",
		recipe = {
			{"","",""},
			{"","default:"..flav,""},
			{"","group:food_cup",""},
		}
	})
end

minetest.register_craftitem("food:rainbow_juice", {
	description = S("Rainbow Juice"),
	inventory_image = "food_rainbow_juice.png",
	on_use = minetest.item_eat(20),
})

minetest.register_craft({
	output = "food:rainbow_juice 99",
	recipe = {
		{"","",""},
		{"","default:nyancat_rainbow",""},
		{"","group:food_cup",""},
	}
})

-- Register cakes
minetest.register_node("food:cake", {
	description = S("Cake"),
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
	description = S("Chocolate Cake"),
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
	description = S("Carrot Cake"),
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
	description = S("Cheese cake"),
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
	description = S("Cake Mix"),
	inventory_image = "food_cakemix_plain.png",
})

minetest.register_craftitem("food:cakemix_choco",{
	description = S("Chocolate Cake Mix"),
	inventory_image = "food_cakemix_choco.png",
})

minetest.register_craftitem("food:cakemix_carrot",{
	description = S("Carrot Cake Mix"),
	inventory_image = "food_cakemix_carrot.png",
})

minetest.register_craftitem("food:cakemix_cheese",{
	description = S("Cheese Cake Mix"),
	inventory_image = "food_cakemix_carrot.png",
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
