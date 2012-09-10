-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/drinks/milkshakes.lua
-- adds drinks
-- =====================================
--
-- =====================================

print ("RubenFood [Master] - Loading Milk Shakes")

minetest.register_craftitem("food:ms_chocolate", {
	description = "Chocolate Milkshake",
	inventory_image = "food_ms_chocolate.png",
	on_use = minetest.item_eat(4)
})