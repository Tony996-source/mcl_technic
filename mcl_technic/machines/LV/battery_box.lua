-- LV Battery box

minetest.register_craft({
	output = 'mcl_technic:lv_battery_box0',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'mcl_technic:battery', 'mcl_core:iron_ingot', 'mcl_technic:battery'},
		{'mcl_technic:battery', 'mcl_technic:lv_cable', 'mcl_technic:battery'},
	}
})

mcl_technic.register_battery_box({
	tier           = "LV",
	max_charge     = 40000,
	charge_rate    = 1000,
	discharge_rate = 4000,
	charge_step    = 500,
	discharge_step = 800,
})

