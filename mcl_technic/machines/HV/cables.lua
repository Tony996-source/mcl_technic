
if minetest.get_modpath("mcl_rubber") then

minetest.register_craft({
	output = 'mcl_technic:hv_cable 3',
	recipe = {
	{'mcl_pipeworks:plastic_sheet', 'mcl_rubber:rubber', 'mcl_pipeworks:plastic_sheet'},
	{'mcl_core:gold_ingot', 'mcl_technic:mv_cable', 'mcl_core:gold_ingot'},
	{'mcl_pipeworks:plastic_sheet', 'mcl_rubber:rubber', 'mcl_pipeworks:plastic_sheet'},
	}
}) 
else
minetest.register_craft({
	output = 'mcl_technic:hv_cable 3',
	recipe = {
	{'mcl_pipeworks:plastic_sheet', 'mcl_technic:rubber', 'mcl_pipeworks:plastic_sheet'},
	{'mcl_core:gold_ingot', 'mcl_technic:mv_cable', 'mcl_core:gold_ingot'},
	{'mcl_pipeworks:plastic_sheet', 'mcl_technic:rubber', 'mcl_pipeworks:plastic_sheet'},
	}
}) 
end
mcl_technic.register_cable("HV", 3/16)

