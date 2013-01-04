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

print ("Food [Master] - Loading Hot")

-----------------------------Coffee-----------------------------

minetest.register_craftitem("food:coffeebean_cooked",{
	description = "Roasted Coffee Beans",
	tiles = {"food_coffee_cooked.png"},
	inventory_image = "food_coffee_cooked.png",
})

minetest.register_craftitem("food:coffee", {
	description = "Coffee",
	inventory_image = "food_coffee_cup.png",
	on_use = minetest.item_eat(10),
	groups={food=1},
})

minetest.register_craft({
	output = '"food:coffee" 1',
	recipe = {
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:cup"','""'},
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
	cooktime = 5,
})
