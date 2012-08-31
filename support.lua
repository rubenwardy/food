-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- ======================================
-- >> rubenfood/support.lua
-- adds support for other mods
-- ======================================
-- [support]
-- ======================================

print "RubenFood [Support] - Initialising"
function node_implement(modname,n_ext,n_int,resultfunc)
         if not minetest.get_modpath(modname) then
            resultfunc()
         else
            minetest.register_alias(n_int,n_ext)
         end
end







print "RubenFood [Support] - Farming Mod"
node_implement("farming","farming:flour","rubenfood:flour",function()
   minetest.register_craftitem("rubenfood:flour", {
	description = "Flour",
	inventory_image = "farming_flour.png",
})
end)

node_implement("farming","farming:strawberry_item","rubenfood:strawberry",function()
minetest.register_craftitem("rubenfood:strawberry", {
	description = "Strawberry",
	inventory_image = "farming_strawberry.png",
	on_use = minetest.item_eat(2),
})
end)





print "RubenFood [Support] - Animal Mod"
node_implement("animalmaterials","animalmaterials:glass","rubenfood:cup",function()
   minetest.register_craftitem("rubenfood:cup",{
	description = "Glass",
	tiles = {"ruben_cup.png"},
	inventory_image = "ruben_cup.png",
})
end)

node_implement("animalmaterials","animalmaterials:egg","rubenfood:egg",function()
 minetest.register_craftitem("rubenfood:egg", {
	description = "Egg",
	image = "animalmaterials_egg.png",
	stack_max=10
})
end)

node_implement("animalmaterials","animalmaterials:milk","rubenfood:milk",function()
  minetest.register_craftitem("rubenfood:milk", {
	description = "Milk",
	image = "animalmaterials_milk.png",
	on_use = minetest.item_eat(1),
	groups = { eatable=1 },
	stack_max=10
})
end)









