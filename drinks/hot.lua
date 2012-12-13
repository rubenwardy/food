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

print ("Food [Modern] - Loading Hot")


-------------------------Hot Chocolate--------------------------

minetest.register_craftitem("food_modern:hotchoco", {
	description = "Hot Chocolate",
	inventory_image = "food_hotchoco.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
output = '"food_modern:hotchoco" 1 ',
recipe = {
{"food:chocolate_powder"},
{"food:milk"},
{"food:mug"},
},
})


