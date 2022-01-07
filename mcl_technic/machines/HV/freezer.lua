-- HV freezer

minetest.register_craft({
	output = 'mcl_technic:hv_freezer',
	recipe = {
	{'mcl_technic:steel_ingot', 'mcl_technic:carbon_plate', 'mcl_technic:steel_ingot'},
	{'mcl_pipeworks:tube_1', 'mcl_core:gold_ingot',    'mcl_pipeworks:tube_1'},
	{'mcl_technic:steel_ingot', 'mcl_technic:hv_cable', 'mcl_technic:steel_ingot'},
	}
})

mcl_technic.register_freezer({tier = "HV", demand = {1600, 1200, 800}, speed = 20, upgrade = 2, tube = 2})
