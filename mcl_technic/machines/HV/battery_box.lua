-- HV battery box

minetest.register_craft({
	output = 'mcl_technic:hv_battery_box0',
	recipe = {
		{'mcl_technic:battery', 'mcl_technic:mv_battery_box0', 'mcl_technic:battery'},
		{'mcl_technic:battery', 'mcl_core:gold_ingot',  'mcl_technic:battery'},
		{'mcl_technic:battery', 'mcl_technic:hv_cable',        'mcl_technic:battery'},
	}
})

mcl_technic.register_battery_box({
	tier           = "HV",
	max_charge     = 1000000,
	charge_rate    = 100000,
	discharge_rate = 400000,
	charge_step    = 10000,
	discharge_step = 40000,
	upgrade        = 1,
	tube           = 1,
})

