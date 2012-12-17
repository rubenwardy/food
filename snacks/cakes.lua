-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/snacks/cakes.lua
-- adds cakes
-- =====================================
-- [regis-food] Plain Cake
-- [craft] Plain Cake
-- [regis-food] Chocolate Cake
-- [craft] Chocolate Cake
-- [regis-food] Carrot Cake
-- [craft] Chocolate Cake
-- =====================================
print("Food [Master] - Loading Cakes")

--------------------------Cakes-------------------------
minetest.register_craftitem("food:cakemix_plain",{
	description = "Cake Mix",
	inventory_image = "food_pastry.png",
})

minetest.register_craftitem("food:cakemix_choco",{
	description = "Chocolate Cake Mix",
	inventory_image = "food_pastry_choco.png",
})

minetest.register_craftitem("food:cakemix_carrot",{
	description = "Carrot Cake Mix",
	inventory_image = "food_pastry_carrot.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food:cake",
	recipe = "food:cakemix_plain",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "food:cake_chocolate",
	recipe = "food:cakemix_choco",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "food:cake_carrot",
	recipe = "food:cakemix_carrot",
	cooktime = 10,
})

minetest.register_craftitem("food:cake", {
	description = "Cake",
	inventory_image = "food_cake.png",
	on_use = minetest.item_eat(30),
	groups={food=3},
})

minetest.register_craftitem("food:cake_chocolate", {
	description = "Chocolate Cake",
	inventory_image = "food_cake_choco.png",
	on_use = minetest.item_eat(40),
	groups={food=3},
})

minetest.register_craftitem("food:cake_carrot", {
	description = "Carrot Cake",
	inventory_image = "food_cake_carrot.png",
	on_use = minetest.item_eat(40),
	groups={food=3},
})






----------------------------- Cake Pastry ----------------------------

minetest.register_craft({
	output = '"food:cakemix_plain" 1',
	recipe = {
		{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})

minetest.register_craft({
	output = '"food:cakemix_choco" 1',
	recipe = {
	{'""','"food:chocolate_milk"','""'},	{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})

minetest.register_craft({
	output = '"food:cakemix_carrot" 1',
	recipe = {
	{'""','"food:carrot"','""'},	{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})
