-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/support.lua
-- adds support for other modss
-- adds items and aliases that are needed
-- ======================================
-- [regis-item] Flour
-- [regis-item] Milk
-- [regis-item] Egg
-- [regis-food] Cheese
-- [craft] Cheese
-- [regis-item] Butter
-- [craft] Butter
-- ======================================




------------------------------------aliases------------------------------------

minetest.register_alias("farming:flour","rubenfood:flour")
minetest.register_alias("farming:cake_mix", "rubenfood:dough")
minetest.register_alias("farming:bread", "rubenfood:bread")

minetest.register_alias("animalmaterials:milk","rubenfood:milk")
minetest.register_alias("animalmaterials:egg","rubenfood:egg")





------------------------------------farming------------------------------------
minetest.register_craftitem("rubenfood:flour", {
	description = "Flour",
	inventory_image = "farming_flour.png",
})

------------------------------------animals------------------------------------
minetest.register_craftitem("rubenfood:milk", {
	description = "Milk",
	image = "animalmaterials_milk.png",
	on_use = minetest.item_eat(1),
	groups = { eatable=1 },
	stack_max=10
})

minetest.register_craftitem("rubenfood:egg", {
	description = "Egg",
	image = "animalmaterials_egg.png",
	stack_max=10
})