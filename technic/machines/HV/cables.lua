
minetest.register_craft({
	output = 'technic:hv_cable 3',
	recipe = {
	{'pipeworks:plastic_sheet', 'technic:rubber', 'pipeworks:plastic_sheet'},
	{'mcl_core:gold_ingot', 'mcl_core:gold_ingot', 'mcl_core:gold_ingot'},
	{'pipeworks:plastic_sheet', 'technic:rubber', 'pipeworks:plastic_sheet'},
	}
}) 

technic.register_cable("HV", 3/16)

