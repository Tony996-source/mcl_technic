
minetest.register_craft({
	output = 'mcl_technic:hv_cable 3',
	recipe = {
	{'pipeworks:plastic_sheet', 'mcl_technic:rubber', 'pipeworks:plastic_sheet'},
	{'mcl_core:gold_ingot', 'mcl_core:gold_ingot', 'mcl_core:gold_ingot'},
	{'pipeworks:plastic_sheet', 'mcl_technic:rubber', 'pipeworks:plastic_sheet'},
	}
}) 

mcl_technic.register_cable("HV", 3/16)

