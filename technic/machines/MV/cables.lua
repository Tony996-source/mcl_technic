
minetest.register_alias("mv_cable", "technic:mv_cable")

minetest.register_craft({
	output = 'technic:mv_cable 3',
	recipe ={
	{'technic:rubber', 'technic:rubber', 'technic:rubber'},
	{'mcl_core:gold_ingot', 'mcl_core:gold_ingot', 'mcl_core:gold_ingot'},
	{'technic:rubber', 'technic:rubber', 'technic:rubber'},
	}
}) 

technic.register_cable("MV", 2.5/16)

