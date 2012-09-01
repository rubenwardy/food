-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/sandwich.lua
-- adds sandwich
-- ======================================
-- [regis-food] Cheese
-- [craft] Cheese
-- [regis-item] Butter
-- [craft] Butter
-- ======================================

print "RubenFood [Master] - Loading Sandwiches"

minetest.register_craftitem("food:sw_meat", {
	description = "Venison Sandwich",
	inventory_image = "food_sw_meat.png",
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("food:sw_cheese", {
	description = "Cheese Sandwich",
	inventory_image = "food_sw_cheese.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craftitem("food:burger", {
	description = "Burger",
	inventory_image = "food_burger.png",
	on_use = minetest.item_eat(10),
})

minetest.register_craft({
	output = '"food:sw_meat" 1',
	recipe = {
                 {"",'"food:bread_slice"',""},
		{"food:butter","food:meat",'"food:butter"'},
		{"",'"food:bread_slice"',""},
	}
})

minetest.register_craft({
	output = '"food:sw_cheese" 1',
	recipe = {
                 {"",'"food:bread_slice"',""},
		{"food:butter","food:cheese",'"food:butter"'},
		{"",'"food:bread_slice"',""},
	}
})
