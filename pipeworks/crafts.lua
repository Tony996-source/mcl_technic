-- Crafting recipes for materials

minetest.register_craftitem("pipeworks:oil_extract", {
	description = "Oil extract",
	inventory_image = "basic_materials_oil_extract.png",
})

minetest.register_craftitem("pipeworks:paraffin", {
	description = "Unprocessed paraffin",
	inventory_image = "basic_materials_paraffin.png",
})

minetest.register_craftitem("pipeworks:plastic_sheet", {
	description = "Plastic sheet",
	inventory_image = "basic_materials_plastic_sheet.png",
})

-- crafts

minetest.register_craft({
	type = "cooking",
	output = "pipeworks:plastic_sheet",
	recipe = "pipeworks:paraffin",
})


minetest.register_craft({
	type = "cooking",
	output = "pipeworks:paraffin",
	recipe = "pipeworks:oil_extract",
})

minetest.register_craft({
	type = "fuel",
	recipe = "pipeworks:oil_extract",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "pipeworks:paraffin",
	burntime = 30,
})

minetest.register_craft({
	type = "shapeless",
	output = "pipeworks:oil_extract 2",
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
	output = "pipeworks:accelerator_tube_1 2",
	recipe = {
		"pipeworks:tube_1", "mesecons:redstone", "mcl_core:iron_ingot", 
			  "mesecons:redstone"
	},
})
	
minetest.register_craft( {
    type = "shapeless",
	output = "pipeworks:priority_tube_1 6",
	recipe = {
		"pipeworks:tube_1", "mcl_core:gold_ingot", "mcl_core:gold_ingot" 
	},
})
