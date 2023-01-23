
minetest.register_alias("mv_cable", "mcl_technic:mv_cable")

       minetest.register_craft({
	       output = 'mcl_technic:mv_cable 3',
	       recipe ={
	       {'mcl_technic:rubber', 'mcl_technic:rubber', 'mcl_technic:rubber'},
	       {'mcl_copper:copper_ingot', 'mcl_technic:lv_cable', 'mcl_copper:copper_ingot'},
	       {'mcl_technic:rubber', 'mcl_technic:rubber', 'mcl_technic:rubber'},
	}
}) 

mcl_technic.register_cable("MV", 2.5/16)

