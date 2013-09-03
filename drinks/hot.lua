-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/drinks/hot.lua
-- adds hot drinks
-- =====================================
-- [regis-food] Coffee
-- [craft] Coffe
-- [regis-food] Hot Chocolate
-- [craft] Hot Chocolate
-- =====================================

print ("RubenFood [Master] - Loading Hot")

-----------------------------Coffee-----------------------------

minetest.register_craftitem("food:coffeebean",{
	description = "Raw Coffee Bean",
	tiles = {"food_coffee.png"},
	inventory_image = "food_coffee.png",
})

minetest.register_craftitem("food:coffeebean_cooked",{
	description = "Cooked Coffee Bean",
	tiles = {"food_coffee_cooked.png"},
	inventory_image = "food_coffee_cooked.png",
})

minetest.register_craftitem("food:coffee", {
	description = "Coffee",
	inventory_image = "food_coffee_cup.png",
	on_use = minetest.item_eat(10),
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




-------------------------Hot Chocolate--------------------------

minetest.register_craftitem("food:hotchoco", {
	description = "Hot Chocolate",
	inventory_image = "food_hotchoco.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
output = '"food:hotchoco" 1 ',
recipe = {
{"food:chocolate_powder"},
{"food:milk"},
{"food:mug"},
},
})
