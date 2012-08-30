-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/baking.lua
-- adds bread and pies
-- =====================================
-- [regis-food] Bread
-- =====================================



-- doughs
minetest.register_craftitem("rubenfood:dough", {
	description = "Dough",
	inventory_image = "farming_cake_mix.png",
})

minetest.register_craft({
	output = "rubenfood:dough",
	type = "shapeless",
	recipe = {"rubenfood:flour", "rubenfood:flour", "rubenfood:flour", "rubenfood:flour", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


--plain bread
minetest.register_craft({
	type = "cooking",
	output = "rubenfood:bread",
	recipe = "rubenfood:dough",
	cooktime = 10
})

minetest.register_craftitem("rubenfood:bread", {
	description = "Bread",
	inventory_image = "ruben_bread.png",
	stack_max = 1,
	on_use = minetest.item_eat(10)
})