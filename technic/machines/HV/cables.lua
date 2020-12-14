
minetest.register_craft({
	output = 'technic:hv_cable 3',
	recipe = {
	{'mcl_core:gold_ingot', 'technic:rubber', 'mcl_core:gold_ingot'},
	{'mesecons:redstone', 'mesecons:redstone', 'mesecons:redstone'},
	{'mcl_core:gold_ingot', 'technic:rubber', 'mcl_core:gold_ingot'},
	}
}) 

technic.register_cable("HV", 3/16)

