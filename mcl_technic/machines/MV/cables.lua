
minetest.register_alias("mv_cable", "mcl_technic:mv_cable")

if minetest.get_modpath("mcl_rubber") then

       minetest.register_craft({
	       output = 'mcl_technic:mv_cable 3',
	       recipe ={
	       {'mcl_rubber:rubber', 'mcl_rubber:rubber', 'mcl_rubber:rubber'},
	       {'mcl_copper:copper_ingot', 'mcl_technic:lv_cable', 'mcl_copper:copper_ingot'},
	       {'mcl_rubber:rubber', 'mcl_rubber:rubber', 'mcl_rubber:rubber'},
	}
}) 

else

       minetest.register_craft({
	       output = 'mcl_technic:mv_cable 3',
	       recipe ={
	       {'mcl_technic:rubber', 'mcl_technic:rubber', 'mcl_technic:rubber'},
	       {'mcl_copper:copper_ingot', 'mcl_technic:lv_cable', 'mcl_copper:copper_ingot'},
	       {'mcl_technic:rubber', 'mcl_technic:rubber', 'mcl_technic:rubber'},
	}
}) 
end

mcl_technic.register_cable("MV", 2.5/16)

