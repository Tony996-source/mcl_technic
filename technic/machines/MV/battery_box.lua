-- MV Battery box

minetest.register_craft({
	output = 'technic:mv_battery_box0',
	recipe = {
	{'technic:battery', 'technic:lv_battery_box0', 'technic:battery'},
	{'technic:battery', 'mcl_copper:copper_ingot', 'technic:battery'},
	{'technic:battery', 'technic:mv_cable', 'technic:battery'},
	}
})

technic.register_battery_box({
	tier           = "MV",
	max_charge     = 200000,
	charge_rate    = 20000,
	discharge_rate = 80000,
	charge_step    = 2000,
	discharge_step = 8000,
	upgrade        = 1,
	tube           = 1,
})

