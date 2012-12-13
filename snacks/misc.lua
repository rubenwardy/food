-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/snacks/crumbles.lua
-- adds crumbles
-- =====================================
-- [regis-food] Rhubarb Crumble
-- =====================================

print "Food [Master] - Loading Splits"

-- Banana Split

minetest.register_craftitem("food_modern:banana_split_raw", {
	description = "Banana Split Raw",
	inventory_image = "food_banana_split_raw.png",
})

minetest.register_craftitem("food_modern:banana_split", {
	description = "Banana Split",
	inventory_image = "food_banana_split.png",
	groups={food=1},
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("food_modern:popcorn", {
	description = "Popcorn",
	inventory_image = "food_popcorn.png",
	groups={food=1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("food_modern:corn_seed", {
	description = "Corn Pips",
	inventory_image = "food_corn_pip.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food_modern:popcorn",
	recipe = "food_modern:corn_seed",
})

minetest.register_craft({
	output = "food_modern:corn_seed",
	recipe = {{"farming:wheat_seed"}},
})

minetest.register_craft({
	output = "food_modern:banana_split_raw",
	recipe = {{"food:chocolate_milk"},{"food:banana"}},
})
minetest.register_craft({
	type = "cooking",
	output = "food_modern:banana_split",
	recipe = "food_modern:banana_split_raw",
})
