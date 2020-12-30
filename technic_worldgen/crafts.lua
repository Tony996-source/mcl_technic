-- Copper

minetest.register_craft({
	output = 'technic:copper_block',
	recipe = {
		{'technic:copper_ingot', 'technic:copper_ingot', 'technic:copper_ingot'},
		{'technic:copper_ingot', 'technic:copper_ingot', 'technic:copper_ingot'},
		{'technic:copper_ingot', 'technic:copper_ingot', 'technic:copper_ingot'},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'technic:copper_ingot 9',
	recipe = {'technic:copper_ingot'},
})

minetest.register_craft({
	output = 'technic:copper_ingot',
	recipe = {
		{'technic:copper_nugget', 'technic:copper_nugget', 'technic:copper_nugget'},
		{'technic:copper_nugget', 'technic:copper_nugget', 'technic:copper_nugget'},
		{'technic:copper_nugget', 'technic:copper_nugget', 'technic:copper_nugget'},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'technic:copper_nugget 9',
	recipe = {'technic:copper_ingot'},
})

minetest.register_craft({
	type = "cooking",
	output = "technic:copper_ingot",
	recipe = "technic:mineral_copper",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "technic:copper_ingot",
	recipe = "technic:copper_dust",
	cooktime = 10,
})
