-- Loads the animal mod based crafting
print ("RubenFood: Loading animal+farming based foods")

---------------Cake Pastry-----------

minetest.register_craft({
	output = '"rubenfood:cakemix_plain" 1',
	recipe = {
		{'"farming:wheat"','"animalmaterials:milk"','"animalmaterials:egg"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:cakemix_choco" 1',
	recipe = {
	{'""','"default:dirt"','""'},	{'"farming:wheat"','"animalmaterials:milk"','"animalmaterials:egg"'},
	}
})