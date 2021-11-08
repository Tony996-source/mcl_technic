
minetest.register_alias("mv_cable", "technic:mv_cable")

if minetest.get_modpath("mcl_copper") then
       minetest.register_craft({
	       output = 'technic:mv_cable 3',
	       recipe ={
	       {'technic:rubber', 'technic:rubber', 'technic:rubber'},
	       {'mcl_copper:copper_ingot', 'mcl_copper:copper_ingot', 'mcl_copper:copper_ingot'},
	       {'technic:rubber', 'technic:rubber', 'technic:rubber'},
	}
}) 
else
       minetest.register_craft({
	       output = 'technic:mv_cable 3',
	       recipe ={
	       {'technic:rubber', 'technic:rubber', 'technic:rubber'},
	       {'technic:copper_ingot', 'technic:copper_ingot', 'technic:copper_ingot'},
	       {'technic:rubber', 'technic:rubber', 'technic:rubber'},
	}
}) 

end

technic.register_cable("MV", 2.5/16)

