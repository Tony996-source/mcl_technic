-- HV battery box

minetest.register_craft({
	output = 'technic:hv_battery_box0',
	recipe = {
		{'technic:battery', 'mcl_core:iron_ingot', 'technic:battery'},
		{'technic:battery', 'mcl_core:gold_ingot',  'technic:battery'},
		{'technic:battery', 'technic:hv_cable',        'technic:battery'},
	}
})

technic.register_battery_box({
	tier           = "HV",
	max_charge     = 1000000,
	charge_rate    = 100000,
	discharge_rate = 400000,
	charge_step    = 10000,
	discharge_step = 40000,
	upgrade        = 1,
	tube           = 1,
})

