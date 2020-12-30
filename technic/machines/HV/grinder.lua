-- HV grinder

minetest.register_craft({
	output = 'technic:hv_grinder',
	recipe = {
	{'technic:carbon_plate', 'technic:diamond_drill_head', 'technic:carbon_plate'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:steel_ingot', 'technic:hv_cable', 'technic:steel_ingot'},
	}
})

technic.register_grinder({tier="HV", demand={1200, 900, 600}, speed=8, upgrade=2, tube=2})

