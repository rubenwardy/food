-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/support.lua
-- adds support for other mods
-- ======================================
-- [support]
-- ======================================

print "Food [Support] - Initialising"

--NODE_IMPLEMENT() Gets an item from another mod softly
-- modname: the name of the mod that the item will be got from
-- n_ext: the name of the item that we want to get
-- n_int: the name we want to save the item so we can load it as an ingredient
-- resultfunc: if the mod does not exist, then do this function
function node_implement(modname,n_ext,n_int,resultfunc)
         if not minetest.get_modpath(modname) then
            -- Mod is NOT installed
            resultfunc()
         else
            -- Mod IS installed
            minetest.register_alias(n_int,n_ext)
         end
end






print "Food [Support] - Vegetables and Fruit"
print "Food [Support] -  > Bread and Flour"

node_implement("farming","farming:flour","food:flour",function()
node_implement("plantlib","plantlib:wheat","food:wheat",function()

end)
minetest.register_craftitem("food:flour", {
	description = "Flour",
	inventory_image = "farming_flour.png",
})
minetest.register_craft({
	output = '"food:flour" 1',
	recipe = {
		{"food:wheat"},
	}
})
end)

node_implement("farming","farming:bread","food:bread",function()



minetest.register_craftitem("food:bread", {
	description = "Bread",
	inventory_image = "food_bread.png",
	stack_max = 1,
	on_use = minetest.item_eat(10),
	groups={food=2},
})
minetest.register_craft({
	output = "food:dough",
	type = "shapeless",
	recipe = {"food:flour", "food:flour", "food:flour", "food:flour", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
})
minetest.register_craft({
	type = "cooking",
	output = "food:bread",
	recipe = "food:dough",
	cooktime = 10,
})




end)


node_implement("farming","farming:cake_mix","food:dough",function()
minetest.register_craftitem("food:dough", {
	description = "Cake Mix",
	inventory_image = "farming_cake_mix.png",
})
end)



print "Food [Support] -  > Strawberry"

node_implement("farming_plus","farming_plus:strawberry_item","food:strawberry",function()
node_implement("plantlib","plantlib:strawberry","food:strawberry",function()
minetest.register_craftitem("food:strawberry", {
	description = "Strawberry",
	inventory_image = "farming_strawberry.png",
	on_use = minetest.item_eat(2),
})
end)
end)

print "Food [Support] -  > Carrot"

node_implement("farming_plus","farming_plus:carrot_item","food:carrot",function()
node_implement("docfarming","docfarming:carrot","food:carrot",function()
node_implement("plantlib","plantlib:carrot","food:carrot",function()
minetest.register_craftitem("food:carrot", {
	description = "Carrot",
	inventory_image = "farming_carrot.png",
	on_use = minetest.item_eat(3),
})
end)
end)
end)


print "Food [Support] -  > Rhubarb"
node_implement("farming_plus","farming_plus:rhubarb_item","food:rhubarb",function()
minetest.register_craftitem("food:rhubarb", {
	description = "Rhubarb",
	inventory_image = "farming_rhubarb.png",
})
end)

print "Food [Support] -  > Cocoa Bean"
node_implement("farming_plus","farming_plus:cocoa_bean","food:cocoa",function()
minetest.register_craftitem("food:cocoa", {
	description = "Cocoa Bean",
	inventory_image = "farming_cocoa_bean.png",
})
end)


print "Food [Support] -  > Banana"
node_implement("farming_plus","farming_plus:banana","food:banana",function()
minetest.register_node("food:banana", {
	description = "Banana",
	tiles = {"farming_banana.png"},
	inventory_image = "farming_banana.png",
	wield_image = "farming_banana.png",
	drawtype = "torchlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(6),
})
end)

print "Food [Support] -  > Tomato"
node_implement("farming_plus","farming_plus:tomato_item","food:tomato",function()
node_implement("plantlib","plantlib:tomato","food:tomato",function()
minetest.register_craftitem("food:tomato", {
	description = "Tomato",
	inventory_image = "farming_strawberry.png",
	on_use = minetest.item_eat(2),
})
end)
end)

print "Food [Support] -  > Potato"
node_implement("docfarming","docfarming:potato","food:potato",function()
minetest.register_craftitem("food:potato", {
	description = "Potato",
	inventory_image = "potato.png",
})
end)

node_implement("docfarming","docfarming:bakedpotato","food:potato_baked",function()
minetest.register_craftitem("food:potato_baked", {
	description = "Baked Potato",
	inventory_image = "baked_potato.png",
	on_use = minetest.item_eat(6),
})
end)

print "Food [Support] -  > Coffee"
node_implement("plantlib","plantlib:coffee","food:coffeebean",function()
minetest.register_craftitem("food:coffeebean",{
	description = "Raw Coffee Bean",
	tiles = {"food_coffee.png"},
	inventory_image = "food_coffee.png",
})

minetest.register_craft({
	output = '"food:coffeebean" 1',
	recipe = {
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
		{'""','"default:dry_shrub"','""'},
	}
})
end)

print "Food [Support] - Meats and Animal Produce"

print "Food [Support] -  > Raw Meat"
node_implement("mobs","mobs:meat_raw","food:meat_raw",function()
node_implement("animalmaterials","animalmaterials:meat_raw","food:meat_raw",function()
minetest.register_craftitem("food:meat_raw", {
	description = "Raw meat",
	image = "animalmaterials_meat_raw.png",
	on_use = minetest.item_eat(1),
	groups = { meat=1, eatable=1 },
	stack_max=25
})
end)
end)

print "Food [Support] -  > Meat"
node_implement("mobs","mobs:meat","food:meat",function()
minetest.register_craftitem("food:meat", {
	description = "Venison",
	inventory_image = "food_meat.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food:meat",
	recipe = "food:meat_raw",
	cooktime = 20
})
end)

node_implement("my_mobs","my_mobs:rabbit_cooked","food:rabbit",function()
node_implement("mobs","mobs:meat","food:rabbit",function()
minetest.register_craftitem("food:rabbit", {
	description = "Cooked Rabbit",
	inventory_image = "my_mobs_cooked_rabbit.png",
	
	on_use = minetest.item_eat(5),
})
end)
end)


print "Food [Support] -  > Egg"
node_implement("animalmaterials","animalmaterials:egg","food:egg",function()
 minetest.register_craftitem("food:egg", {
	description = "Egg",
	image = "animalmaterials_egg.png",
	stack_max=10
})
end)

print "Food [Support] -  > Milk"
node_implement("animalmaterials","animalmaterials:milk","food:milk",function()
node_implement("my_mobs","my_mobs:milk_glass_cup","food:milk",function()
  minetest.register_craftitem("food:milk", {
	description = "Milk",
	image = "animalmaterials_milk.png",
	on_use = minetest.item_eat(1),
	groups = { eatable=1 },
	stack_max=10
})
end)
end)

print "Food [Support] - Vessels and Cutlery"

node_implement("vessels","vessels:drinking_glass","food:cup",function()
node_implement("animalmaterials","animalmaterials:glass","food:cup",function()
   minetest.register_craftitem("food:cup",{
	description = "Glass",
	tiles = {"food_cup.png"},
	inventory_image = "food_cup.png",
})
end)
end)











