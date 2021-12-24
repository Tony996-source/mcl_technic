-- MV Battery box

minetest.register_craft({
	output = 'mcl_technic:mv_battery_box0',
	recipe = {
	{'mcl_technic:battery', 'mcl_technic:lv_battery_box0', 'mcl_technic:battery'},
	{'mcl_technic:battery', 'mcl_copper:copper_ingot', 'mcl_technic:battery'},
	{'mcl_technic:battery', 'mcl_technic:mv_cable', 'mcl_technic:battery'},
	}
})

mcl_technic.register_battery_box({
	tier           = "MV",
	max_charge     = 200000,
	charge_rate    = 20000,
	discharge_rate = 80000,
	charge_step    = 2000,
	discharge_step = 8000,
	upgrade        = 1,
	tube           = 1,
})

