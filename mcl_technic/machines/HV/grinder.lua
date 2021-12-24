-- HV grinder

minetest.register_craft({
	output = 'mcl_technic:hv_grinder',
	recipe = {
	{'mcl_technic:carbon_plate', 'mcl_technic:mv_grinder', 'mcl_technic:carbon_plate'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'mcl_technic:steel_ingot', 'mcl_technic:hv_cable', 'mcl_technic:steel_ingot'},
	}
})

mcl_technic.register_grinder({tier="HV", demand={1200, 900, 600}, speed=20, upgrade=2, tube=2})

