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
if not minetest.get_modpath("farming") then

else
minetest.register_craftitem(":farming:cake_mix", {
	description = "Dough",
	inventory_image = "farming_cake_mix.png",
})
end