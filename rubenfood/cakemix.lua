-- Loads the animal mod based crafting

---------------Cake Pastry-----------

minetest.register_craft({
	output = '"rubenfood:cakemix_plain" 1',
	recipe = {
		{'"rubenfood:flour"','"rubenfood:milk"','"rubenfood:egg"'},
	}
})

minetest.register_craft({
	output = '"rubenfood:cakemix_choco" 1',
	recipe = {
	{'""','"default:dirt"','""'},	{'"rubenfood:flour"','"rubenfood:milk"','"rubenfood:egg"'},
	}
})