-- FOOD MOD
-- A mod written by rubenwardy that adds food to the minetest game
--
-- =========================================================================
-- >> food/init.lua
-- The support api for the mod, and some
-- basic foods
-- =========================================================================
-- version 2.3
-- sorting food definitions per module
-- code sorting
-- recipe conflicts solved (identical ingredients in other mods)
-- recipe functions renamed to prevend conflicts (all start with food_)
-- changed cocoa_powder in cocoa (too complex & intensive in farming)
-- create functions for juices same way as soups
-- =========================================================================

-- variables
-------------------------------------------------------------------------------
food = {
	supported = {},
	atsup = {},
	df = {},
	debug = false,
	version = 2.3
}

print("Food version "..food.version.." loading...")

if food.debug then print "[Food] debug is ON" end

-- Boilerplate to support localized strings if intllib mod is installed.
-------------------------------------------------------------------------------
local S
if (intllib) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function ( s ) return s end
end

-- Loading config file
-------------------------------------------------------------------------------
local modpath = minetest.get_modpath(minetest.get_current_modname())
local input = io.open(modpath.."/food.conf", "r")
if input then
	dofile(modpath.."/food.conf")
	input:close()
	input = nil
end

-- Checks for external content, and adds support
-------------------------------------------------------------------------------
function food.support(group,mod,item)
	food.atsup[group] = true
	if not minetest.get_modpath(mod) then
		if food.debug then
			print("[Food] (debug) mod: '"..mod.."' is not installed")
		end
		return
	end

	local data = minetest.registered_items[item]
	if not data then
		print("[Food] (Warning) item '"..item.."' not found")
		return
	end

	-- Need to copy this table, not modify it in place, otherwise it can change
	-- the groups for ALL craftitems that use the default groups.
	g = {}
	if data.groups then
	for k, v in pairs(data.groups) do
		g[k] = v
	end
	end
	g["food_"..group] = 1
	minetest.override_item(item, {groups = g})

	food.supported[group] = true
end

-- Defines built in items if needed
-------------------------------------------------------------------------------
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

	if food.debug then
		print("registering "..group.." inbuilt definition")
	end

	add()
end

-- Deprecated. Not used in this module, but still used in food_sweet
-------------------------------------------------------------------------------
function food.craft(craft)
	minetest.register_craft(craft)
end

-- Checks for hunger mods to register food on
-------------------------------------------------------------------------------
function food.item_eat(amt)
	if minetest.get_modpath("diet") then
		return diet.item_eat(amt)
	elseif minetest.get_modpath("hud") then
		return hud.item_eat(amt)
	else
		return minetest.item_eat(amt)
	end
end

-- Registers craft item or node depending on settings
-------------------------------------------------------------------------------
function food.register(name,data,mod)
	if (minetest.setting_getbool("food_use_2d") or (mod ~= nil and minetest.setting_getbool("food_"..mod.."_use_2d"))) then
		minetest.register_craftitem(name,{
			description = data.description,
			inventory_image = data.inventory_image,
			groups = data.groups,
			on_use = data.on_use
		})
	else
		local newdata = {
			description = data.description,
			tiles = data.tiles,
			groups = data.groups,
			on_use = data.on_use,
			walkable = false,
			sunlight_propagates = true,
			drawtype = "nodebox",
			paramtype = "light",
			node_box = data.node_box
		}
		if (minetest.setting_getbool("food_2d_inv_image")) then
			newdata.inventory_image = data.inventory_image
		end
		minetest.register_node(name,newdata)
	end
end

-- Debug to check all supports have in built version, etc
-------------------------------------------------------------------------------
if food.debug then
minetest.after(0, function()
	for name, val in pairs(food.atsup) do
		if not food.df[name] then
			print("[Food] (debug) ingredient "..name.." has no built in equiv")

		end
	end

	for name, val in pairs(food.df) do
		if not food.atsup[name] then
			print("[Food] (debug) recipe "..name.." has no supported external equiv")
		end
	end
end)
end

-- Add support for other mods
-------------------------------------------------------------------------------
local function _meat(type,mod,item)
	food.support(type,mod,item)
	food.support("meat",mod,item)
end

if minetest.get_modpath("animalmaterials") then
	print("  Adding animalmaterials items")
	food.support("meat_raw","animalmaterials","animalmaterials:meat_chicken")
	food.support("meat_raw","animalmaterials","animalmaterials:meat_lamb")
	food.support("meat_raw","animalmaterials","animalmaterials:meat_beef")
	food.support("meat_raw","animalmaterials","animalmaterials:meat_venison")
	food.support("fish_raw","animalmaterials","animalmaterials:fish_clownfish")
	food.support("fish_raw","animalmaterials","animalmaterials:fish_bluewhite")
	--food.support("fish_raw","animalmaterials","animalmaterials:fish_shark") -- doesn't work
	food.support("egg","animalmaterials","animalmaterials:egg")
	food.support("egg","animalmaterials","animalmaterials:egg_big")
	food.support("milk","animalmaterials","animalmaterials:milk")
	if FOOD_CRAFT_EGG  == 2 then FOOD_CRAFT_EGG  = 0 end
	if FOOD_CRAFT_FISH == 2 then FOOD_CRAFT_FISH = 0 end
	if FOOD_CRAFT_MEAT == 2 then FOOD_CRAFT_MEAT = 0 end
	if FOOD_CRAFT_MILK == 2 then FOOD_CRAFT_MILK = 0 end
end

if minetest.get_modpath("bushes_classic") then
	print("  Adding bushes classic items")
	food.support("strawberry","bushes_classic","bushes:strawberry")
	food.support("sugar","bushes_classic","bushes:sugar")
	if FOOD_CRAFT_SBERRY == 2 then FOOD_CRAFT_SBERRY = 0 end
	if FOOD_CRAFT_SUGAR == 2  then FOOD_CRAFT_SUGAR = 0 end
end

if minetest.get_modpath("docfarming") then
	food.support("carrot","docfarming","docfarming:carrot")
	food.support("potato","docfarming","docfarming:potato")
	if FOOD_CRAFT_CARROT == 2 then FOOD_CRAFT_CARROT = 0 end
	if FOOD_CRAFT_POTATO == 2 then FOOD_CRAFT_POTATO = 0 end
end

if minetest.get_modpath("farming") then
	print("  Adding farming items")
	food.support("wheat","farming","farming:wheat")
	food.support("flour","farming","farming:flour")
	if FOOD_CRAFT_WHEAT == 2 then FOOD_CRAFT_WHEAT = 0 end
	if FOOD_CRAFT_FLOUR == 2 then FOOD_CRAFT_FLOUR = 0 end
end

if minetest.get_modpath("farming_plus") then
	print("  Adding farming plus items")
	food.support("carrot","farming_plus","farming_plus:carrot_item")
	food.support("cocoa","farming_plus","farming_plus:cocoa_bean")
	food.support("potato","farming_plus","farming_plus:potato_item")
	food.support("rhubarb","farming_plus","farming_plus:rhubarb_item")
	food.support("strawberry","farming_plus","farming_plus:strawberry_item")
	food.support("tomato","farming_plus","farming_plus:tomato_item")
	if FOOD_CRAFT_CARROT  == 2 then FOOD_CRAFT_CARROT  = 0 end
	if FOOD_CRAFT_COCOA   == 2 then FOOD_CRAFT_COCOA   = 0 end
	if FOOD_CRAFT_POTATO  == 2 then FOOD_CRAFT_POTATO  = 0 end
	if FOOD_CRAFT_RHUBARB == 2 then FOOD_CRAFT_RHUBARB = 0 end
	if FOOD_CRAFT_SBERRY  == 2 then FOOD_CRAFT_SBERRY  = 0 end
	if FOOD_CRAFT_TOMATO  == 2 then FOOD_CRAFT_TOMATO  = 0 end
end

if minetest.get_modpath("jkanimals") then
	print("  Adding jkanimals items")
	food.support("egg","jkanimals","jkanimals:egg")
	food.support("milk","jkanimals","jkanimals:bucket_milk")
	food.support("meat","jkanimals","jkanimals:meat")
	if FOOD_CRAFT_EGG  == 2 then FOOD_CRAFT_EGG  = 0 end
	if FOOD_CRAFT_MILK == 2 then FOOD_CRAFT_MILK = 0 end
end

if minetest.get_modpath("jkfarming") then
	print("  Adding jkfarming items")
	food.support("carrot","jkfarming","jkfarming:carrot")
	food.support("sugar","jkfarming","jkfarming:sugar")
	if FOOD_CRAFT_CARROT == 2 then FOOD_CRAFT_CARROT = 0 end
	if FOOD_CRAFT_SUGAR  == 2 then FOOD_CRAFT_SUGAR  = 0 end
end

if minetest.get_modpath("mobs") then
	print("  Adding mobs items")
	food.support("meat","mobs","mobs:meat")
end

if minetest.get_modpath("mobf") then
	print("  Adding mobf items")
	_meat("pork","mobfcooking","mobfcooking:cooked_pork")
	_meat("beef","mobfcooking","mobfcooking:cooked_beef")
	_meat("chicken","mobfcooking","mobfcooking:cooked_chicken")
	_meat("lamb","mobfcooking","mobfcooking:cooked_lamb")
	_meat("venison","mobfcooking","mobfcooking:cooked_venison")
end

if minetest.get_modpath("my_mobs") then
	print("  Adding my_mobs items")
	food.support("milk","my_mobs","my_mobs:milk_glass_cup")
	if FOOD_CRAFT_MILK == 2 then FOOD_CRAFT_MILK = 0 end
end

if minetest.get_modpath("plantlib") then
	print("  Adding plantlib items")
	food.support("carrot","plantlib","plantlib:carrot")
	food.support("strawberry","plantlib","plantlib:strawberry")
	food.support("tomato","plantlib","plantlib:tomato")
	if FOOD_CRAFT_CARROT == 2 then FOOD_CRAFT_CARROT = 0 end
	if FOOD_CRAFT_SBERRY == 2 then FOOD_CRAFT_SBERRY = 0 end	
	if FOOD_CRAFT_TOMATO == 2 then FOOD_CRAFT_TOMATO = 0 end
end

if minetest.get_modpath("veggies") then
	print("  Adding veggies items")
	food.support("potato","veggies","veggies:potato")
	if FOOD_CRAFT_POTATO == 2 then FOOD_CRAFT_POTATO = 0 end
end

if minetest.get_modpath("vessels") then
   print("  Adding vessels items")
   food.support("cup","vessels","vessels:drinking_glass")
   if FOOD_CRAFT_GLASS == 2 then FOOD_CRAFT_GLASS = 0 end
end

-- Basic ingredients
-------------------------------------------------------------------------------

-- carrot
if FOOD_CRAFT_CARROT == 1 or FOOD_CRAFT_CARROT == 2 then
	food.asupport("food_carrot",function()
		minetest.register_craftitem("food:carrot", {
			description = S("Carrot"),
			inventory_image = "food_carrot.png",
			groups = {food_carrot=1},
			on_use = food.item_eat(3)
		})
		minetest.register_craft({
			output = "food:carrot",
			recipe = {
				{"default:grass_1"},
				{"group:food_potato"},
				{"group:food_potato"}
			}
		})
	end)
	print("  + Crafting carrot enabled")
else
	print("  - Crafting carrot disabled")
end

-- cocoa
if FOOD_CRAFT_COCOA == 1 or FOOD_CRAFT_COCOA == 2 then
	food.asupport("food_cocoa",function()
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
	print("  + Crafting cocoa enabled")
else
	print("  - Crafting cocoa disabled")
end

-- egg
if FOOD_CRAFT_EGG == 1 or FOOD_CRAFT_EGG == 2 then
	food.asupport("food_egg",function()
		minetest.register_craftitem("food:egg",{
			description = S("Egg"),
			inventory_image = "food_egg.png",
			groups = {food_egg=1}
		})
		minetest.register_craft({
			output = "food:egg",
			recipe = {
				{"", "default:sand", ""},
				{"default:sand", "default:dirt", "default:sand"},
				{"", "default:sand", ""}
			}
		})
	end)
	print("  + Crafting egg enabled")
else
	print("  - Crafting egg disabled")
end

-- fish
if FOOD_CRAFT_FISH == 1 or FOOD_CRAFT_FISH == 2 then
	food.asupport("food_fish_raw",function()
		minetest.register_craftitem("food:fish_raw", {
			description = S("Raw fish"),
			image = "food_fish_raw.png",
			on_use = food.item_eat(1),
			groups = { fish=1, eatable=1, food_fish_raw=1 },
			stack_max=25
		})
		minetest.register_craft({
			output = "food:fish_raw",
			recipe = {
				{"default:apple","default:apple","default:dirt"}
			}
		})
	end)
	print("  + Crafting raw fish enabled")
else
	print("  - Crafting raw fish disabled")
end

-- flour
if FOOD_CRAFT_FLOUR == 1 or FOOD_CRAFT_FLOUR == 2 then
	food.asupport("food_flour",function()
		minetest.register_craftitem("food:flour", {
			description = S("Flour"),
			inventory_image = "food_flour.png",
			groups = {food_flour = 1}
		})
		minetest.register_craft({
			output = "food:flour",
			recipe = {
				{"group:food_wheat","group:food_wheat","group:food_wheat","group:food_wheat"}
			}
		})
	end)
	print("  + Crafting flour enabled")
else
	print("  - Crafting flour disabled")
end

-- meat
if FOOD_CRAFT_MEAT == 1 or FOOD_CRAFT_MEAT == 2 then
	food.asupport("food_meat_raw",function()
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
				{"default:dirt","default:apple","default:apple"}
			}
		})
	end)
	print("  + Crafting raw meat enabled")
else
	print("  - Crafting raw meat disabled")
end

-- milk
if FOOD_CRAFT_MILK == 1 or FOOD_CRAFT_MILK == 2 then
	food.asupport("food_milk",function()
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
	print("  + Crafting milk enabled")
else
	print("  - Crafting milk disabled")
end

-- potato
if FOOD_CRAFT_POTATO == 1 or FOOD_CRAFT_POTATO == 2 then
	food.asupport("food_potato",function()
		minetest.register_craftitem("food:potato", {
			description = S("Potato"),
			inventory_image = "food_potato.png",
			groups = {food_potato = 1}
		})
		minetest.register_craft({
			output = "food:potato",
			recipe = {
				{"default:dirt"},
				{"default:apple"},
				{"default:dirt"}
			}
		})
	end)
	print("  + Crafting potato enabled")
else
	print("  - Crafting potato disabled")
end

-- rhubarb
if FOOD_CRAFT_RHUBARB == 1 or FOOD_CRAFT_RHUBARB == 2 then
	food.asupport("food_rhubarb",function()
		minetest.register_craftitem("food:rhubarb", {
			description = S("Rhubarb"),
			inventory_image = "food_rhubarb.png",
			groups = {food_rhubarb=1}
		})
		minetest.register_craft({
			output = "food:rhubarb 2",
			recipe = {
				{"default:grass_1"},
				{"default:apple"},
				{"default:apple"}
			}
		})
	end)
	print("  + Crafting rhubarb enabled")
else
	print("  - Crafting rhubarb disabled")
end

-- strawberry
if FOOD_CRAFT_SBERRY == 1 or FOOD_CRAFT_SBERRY == 2 then
	food.asupport("food_strawberry",function()
		minetest.register_craftitem("food:strawberry", {
			description = S("Strawberry"),
			inventory_image = "food_strawberry.png",
			groups = {food_strawberry=1}
		})
		minetest.register_craft({
			output = "food:strawberry",
			recipe = {
				{"default:grass_1"},
				{"default:apple"}
			}
		})
	end)
	print("  + Crafting strawberry enabled")
else
	print("  - Crafting strawberry disabled")
end

-- sugar
if FOOD_CRAFT_SUGAR == 1 or FOOD_CRAFT_SUGAR == 2 then
	food.asupport("food_sugar",function()
		minetest.register_craftitem("food:sugar", {
			description = S("Sugar"),
			inventory_image = "food_sugar.png",
			groups = {food_sugar=1}
		})
		minetest.register_craft({
			output = "food:sugar",
			recipe = {
				{"default:papyrus","default:papyrus"},
			}
		})
	end)
	print("  + Crafting sugar enabled")
else
	print("  - Crafting sugar disabled")
end

-- tomato
if FOOD_CRAFT_TOMATO == 1 or FOOD_CRAFT_TOMATO == 2 then
	food.asupport("food_tomato",function()
		minetest.register_craftitem("food:tomato", {
			description = S("Tomato"),
			inventory_image = "food_tomato.png",
			groups = {food_tomato = 1}
		})
		minetest.register_craft({
			output = "food:tomato",
			recipe = {
				{"default:desert_sand"},
				{"default:apple"},
				{"default:desert_sand"}
			}
		})
	end)
	print("  + Crafting tomato enabled")
else
	print("  - Crafting tomato disabled")
end

-- wheat
if FOOD_CRAFT_WHEAT == 1 or FOOD_CRAFT_WHEAT == 2 then
	food.asupport("food_wheat",function()
		minetest.register_craftitem("food:wheat", {
			description = S("Wheat"),
			inventory_image = "food_wheat.png",
			groups = {food_wheat = 1}
		})
		minetest.register_craft({
			output = "food:wheat 2",
			recipe = {
				{"default:dry_shrub"},
				{"default:dry_shrub"},
				{"default:dry_shrub"}
			}
		})
	end)
	print("  + Crafting wheat enabled")
else
	print("  - Crafting wheat disabled")
end

-- glass
if FOOD_CRAFT_GLASS == 1 or FOOD_CRAFT_GLASS == 2 then
	food.asupport("food_cup",function()
		minetest.register_craftitem("food:cup", {
			description = S("Cup"),
			inventory_image = "food_cup.png",
			groups = {food_cup = 1}
		})
		minetest.register_craft({
			output = "food:cup",
			recipe = {
				{ "default:glass", "", "default:glass" },
				{ "default:glass", "", "default:glass" },
				{ "default:glass", "default:glass", "default:glass" }
			}
		})
	end)
	print("  + Crafting cup enabled")
else
	print("  - Crafting cup disabled")
end



-- Recipes & food
-------------------------------------------------------------------------------

-- grilled meat
food.asupport("food_meat",function()
	minetest.register_craftitem("food:meat", {
		description = S("Venison"),
		inventory_image = "food_meat.png",
		on_use = food.item_eat(3),
		groups = {food_meat=1,food_chicken=1}
	})
	minetest.register_craft({
		type = "cooking",
		output = "food:meat",
		recipe = "group:food_meat_raw",
		cooktime = 30
	})
end)

-- grilled fish sticks
food.asupport("food_fish",function()
	minetest.register_craftitem("food:fish", {
		description = S("Fish Sticks"),
		inventory_image = "food_fish.png",
		on_use = food.item_eat(1),
		groups = {food_fish=1}
	})

	minetest.register_craft({
		type = "cooking",
		output = "food:fish 6",
		recipe = "group:food_fish_raw",
		cooktime = 20
	})
end)

-- dark chocolate
food.asupport("food_dark_chocolate",function()
	minetest.register_craftitem("food:dark_chocolate",{
		description = S("Dark Chocolate"),
		inventory_image = "food_dark_chocolate.png",
		on_use = food.item_eat(3),
		groups = {food_dark_chocolate=1}
	})
	minetest.register_craft({
		output = "food:dark_chocolate",
		recipe = {
			{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
		}
	})
end)

-- milk chocolate
food.asupport("food_milk_chocolate",function()
	minetest.register_craftitem("food:milk_chocolate",{
		description = S("Milk Chocolate"),
		inventory_image = "food_milk_chocolate.png",
		on_use = food.item_eat(3),
		groups = {food_milk_chocolate=1}
	})
	minetest.register_craft({
		output = "food:milk_chocolate 2",
		recipe = {
				{"","group:food_milk",""},
				{"group:food_cocoa","group:food_cocoa","group:food_cocoa"}
		}
	})
end)

-- pasta
food.asupport("food_pasta",function()
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
end)

-- bowl
food.asupport("food_bowl",function()
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
end)

-- butter
food.asupport("food_butter",function()
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
end)

-- cheese
food.asupport("food_cheese",function()
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
end)

-- baked potato
food.asupport("food_baked_potato",function()
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
end)

-- raw pasta
food.asupport("food_pasta_bake_raw",function()
	minetest.register_craftitem("food:pasta_bake_raw",{
		description = S("Raw Pasta Bake"),
		inventory_image = "food_pasta_bake_raw.png",
	})
	minetest.register_craft({
		output = "food:pasta_bake_raw",
	 	recipe = {
			{"group:food_cheese"},
			{"group:food_pasta"},
			{"group:food_bowl"}
		}
	})
end)

-- baked pasta
food.asupport("food_pasta_bake",function()
	minetest.register_craftitem("food:pasta_bake",{
		description = S("Pasta Bake"),
		inventory_image = "food_pasta_bake.png",
		on_use = food.item_eat(8),
		groups = {food=3}
	})
	minetest.register_craft({
		output = "food:pasta_bake",
		type = "cooking",
	 	recipe = "food:pasta_bake_raw"
	})
end)



-- soups
local soups = {{"tomato","tomato"},{"chicken","meat"}}

for i=1, #soups do
	local flav = soups[i]
	
	--raw soup
	food.asupport("food_soup_"..flav[1].."_raw",function()
		minetest.register_craftitem("food:soup_"..flav[1].."_raw",{
			description = S("Uncooked ".. flav[1].." Soup"),
			inventory_image = "food_soup_"..flav[1].."_raw.png",

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
	end)

    --cooked soup
	food.asupport("food_soup_"..flav[1],function()
		minetest.register_craftitem("food:soup_"..flav[1],{
			description = S(flav[1].." soup"),
			inventory_image = "food_soup_"..flav[1]..".png",
			on_use = food.item_eat(4),
			groups = {food=3}
		})
		minetest.register_craft({
			type = "cooking",
			output = "food:soup_"..flav[1],
			recipe = "food:soup_"..flav[1].."_raw",
		})
	end)
end

-- Juices
local juices = {{"apple","default:apple",2},{"cactus","default:cactus",2},{"rainbow","default:nyancat_rainbow",20},{"rhubarb","group:food_rhubarb",3},{"strawberry","group:food_strawberry",3}}
for i=1, #juices do
	local flav = juices[i]
	food.asupport("food_juice_"..flav[1],function()
		minetest.register_craftitem("food:juice_"..flav[1],{
			description = S(flav[1].." juice"),
			inventory_image = "food_"..flav[1].."_juice.png",
			on_use = food.item_eat(flav[3]),
		})
		minetest.register_craft({
			output = "food:juice_"..flav[1].." 4",
			recipe = {
				{"","",""},
				{"",flav[2],""},
				{"","group:food_cup",""},
			}
		})
	end)
end

-- cakemix plain
food.asupport("food_cakemix_plain",function()
	minetest.register_craftitem("food:cakemix_plain",{
		description = S("Cake Mix"),
		inventory_image = "food_cakemix_plain.png",
	})
	minetest.register_craft({
		output = "food:cakemix_plain",
		recipe = {
			{"group:food_flour","group:food_sugar","group:food_egg"},
		}
	})
end)

-- cakemix plain
food.asupport("food_cakemix_choco",function()
	minetest.register_craftitem("food:cakemix_choco",{
		description = S("Chocolate Cake Mix"),
		inventory_image = "food_cakemix_choco.png",
	})
	minetest.register_craft({
		output = "food:cakemix_choco",
		recipe = {
			{"","group:food_cocoa",""},
			{"group:food_flour","group:food_sugar","group:food_egg"},
		}
	})
end)

-- cakemix carrot
food.asupport("food_cakemix_carrot",function()
	minetest.register_craftitem("food:cakemix_carrot",{
		description = S("Carrot Cake Mix"),
		inventory_image = "food_cakemix_carrot.png",
	})
	minetest.register_craft({
		output = "food:cakemix_carrot",
		recipe = {
			{"","group:food_carrot",""},
			{"group:food_flour","group:food_sugar","group:food_egg"},
		}
	})
end)

-- cake models
-------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------

-- END
-------------------------------------------------------------------------------
print("[Food] Loaded.")