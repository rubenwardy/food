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
minetest.register_craftitem("rubenfood:cakemix_plain",{
	description = "Cake Mix",
	tiles = {"ruben_pastry.png"},
	inventory_image = "ruben_pastry.png",
})

minetest.register_craftitem("rubenfood:cakemix_choco",{
	description = "Chocolate Cake Mix",
	tiles = {"ruben_pastry_choco.png"},
	inventory_image = "ruben_pastry_choco.png",
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:cake",
	recipe = "rubenfood:cakemix_plain",
})

minetest.register_craft({
	type = "cooking",
	output = "rubenfood:cake_chocolate",
	recipe = "rubenfood:cakemix_choco",
})

minetest.register_craftitem("rubenfood:cake", {
	description = "Cake",
	inventory_image = "ruben_cake.png",
	on_use = minetest.item_eat(30),
})

minetest.register_craftitem("rubenfood:cake_chocolate", {
	description = "Chocolate Cake",
	inventory_image = "ruben_cake_choco.png",
	on_use = minetest.item_eat(40),
})






----------------------------- Cake Pastry ----------------------------

minetest.register_craft({
	output = '"rubenfood:cakemix_plain" 1',
	recipe = {
		{'"rubenfood:flour"',"",'"rubenfood:egg"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:cakemix_choco" 1',
	recipe = {
	{'""','"default:dirt"','""'},	{'"rubenfood:flour"',"",'"rubenfood:egg"'},
	}
})