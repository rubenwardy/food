-- Loads the animal mod based crafting
print ("RubenFood: Loading animal+farming based foods")

---------------Cake Pastry-----------

minetest.register_craft({
	output = '"rubenfood:cakemix_plain" 1',
	recipe = {
		{'"rubenfood:wheat"','"rubenfood:milk"','"rubenfood:egg"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:cakemix_choco" 1',
	recipe = {
	{'""','"default:dirt"','""'},	{'"rubenfood:wheat"','"rubenfood:milk"','"rubenfood:egg"'},
	}
})