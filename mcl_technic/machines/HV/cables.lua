
minetest.register_craft({
	output = 'mcl_technic:hv_cable 3',
	recipe = {
	{'mcl_pipeworks:plastic_sheet', 'mcl_technic:rubber', 'mcl_pipeworks:plastic_sheet'},
	{'mcl_core:gold_ingot', 'mcl_core:gold_ingot', 'mcl_core:gold_ingot'},
	{'mcl_pipeworks:plastic_sheet', 'mcl_technic:rubber', 'mcl_pipeworks:plastic_sheet'},
	}
}) 

mcl_technic.register_cable("HV", 3/16)

