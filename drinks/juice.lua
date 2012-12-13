-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/drinks/juice.lua
-- adds juices
-- =====================================
-- [regis-food] Apple Juice
-- [craft] Cactus Juice
-- [regis-food] Cactus Juice
-- [craft] Cactus Juice
-- =====================================

print ("RubenFood [Master] - Loading Juices")

--------------------------Apple Juice--------------------------
minetest.register_craftitem("food:apple_juice", {
	description = "Apple Juice",
	inventory_image = "food_juice_apple.png",
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = '"food:apple_juice" 4',
	recipe = {
		{"","",""},
		{"","default:apple",""},
		{"","food:cup",""},
	}
})





----------------------cactus juice----------------------------
minetest.register_craftitem("food:cactus_juice", {
	description = "Cactuz Juice",
	inventory_image = "food_juice_cactus.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = '"food:cactus_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:cactus"','""'},
		{'""','"food:cup"','""'},
	}
})