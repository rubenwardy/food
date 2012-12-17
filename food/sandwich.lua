-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/food/sandwich.lua
-- adds sandwich
-- ======================================
-- [regis-food] Cheese Sandwich
-- [craft] Cheese Sandwich
-- [regis-food] Venison Sandwich
-- [craft] Venison Sandwich
-- [regis-food] Burger
-- [craft] Burger
-- ======================================

print "Food [Master] - Loading Sandwiches"

minetest.register_craftitem("food:sw_meat", {
	description = "Venison Sandwich",
	inventory_image = "food_sw_meat.png",
	on_use = minetest.item_eat(10),
	groups={food=2},
})

minetest.register_craftitem("food:sw_cheese", {
	description = "Cheese Sandwich",
	inventory_image = "food_sw_cheese.png",
	on_use = minetest.item_eat(8),
	groups={food=2},
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
