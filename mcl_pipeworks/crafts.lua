-- Crafting recipes for materials

minetest.register_craftitem("mcl_pipeworks:oil_extract", {
	description = "Oil extract",
	inventory_image = "mcl_pipeworks_oil_extract.png",
})

minetest.register_craftitem("mcl_pipeworks:plastic_sheet", {
	description = "Plastic sheet",
	inventory_image = "mcl_pipeworks_plastic_sheet.png",
})

-- crafts


minetest.register_craft({
	type = "cooking",
	output = "plastic_sheet",
	recipe = "mcl_pipeworks:oil_extract",
})

minetest.register_craft({
	type = "fuel",
	recipe = "mcl_pipeworks:oil_extract",
	burntime = 30,
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_pipeworks:oil_extract 2",
	recipe = {
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
	}
})

-- Extra Crafts

minetest.register_craft( {
    type = "shapeless",
	output = "mcl_pipeworks:accelerator_tube_1 2",
	recipe = {
		"mcl_pipeworks:tube_1", "mesecons:redstone", "mcl_core:iron_ingot", 
			  "mesecons:redstone"
	},
})
	
minetest.register_craft( {
    type = "shapeless",
	output = "mcl_pipeworks:priority_tube_1 6",
	recipe = {
		"mcl_pipeworks:tube_1", "mcl_core:gold_ingot", "mcl_core:gold_ingot" 
	},
})
