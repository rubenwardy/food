-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/cakes.lua
-- adds cakes
-- =====================================
-- [regis-food] Plain Cake
-- [regis-food] Chocolate Cake
-- =====================================
print("RubenFood [Master] - Loading Cakes")

--------------------------Cakes-------------------------
minetest.register_craftitem("food:cakemix_plain",{
	description = "Cake Mix",
	tiles = {"food_pastry.png"},
	inventory_image = "food_pastry.png",
})

minetest.register_craftitem("food:cakemix_choco",{
	description = "Chocolate Cake Mix",
	tiles = {"food_pastry_choco.png"},
	inventory_image = "food_pastry_choco.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food:cake",
	recipe = "food:cakemix_plain",
})

minetest.register_craft({
	type = "cooking",
	output = "food:cake_chocolate",
	recipe = "food:cakemix_choco",
})

minetest.register_craftitem("food:cake", {
	description = "Cake",
	inventory_image = "food_cake.png",
	on_use = minetest.item_eat(30),
})

minetest.register_craftitem("food:cake_chocolate", {
	description = "Chocolate Cake",
	inventory_image = "food_cake_choco.png",
	on_use = minetest.item_eat(40),
})






----------------------------- Cake Pastry ----------------------------

minetest.register_craft({
	output = '"food:cakemix_plain" 1',
	recipe = {
		{'"food:flour"',"",'"food:egg"'},
	}
})

minetest.register_craft({
	output = '"food:cakemix_choco" 1',
	recipe = {
	{'""','"default:dirt"','""'},	{'"food:flour"',"",'"food:egg"'},
	}
})