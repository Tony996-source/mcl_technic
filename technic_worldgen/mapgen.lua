local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

-- Copper

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "technic:mineral_copper",
	wherein         = stonelike,
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "technic:mineral_copper",
	wherein         = stonelike,
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})


-- Register Extra ore gen.

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})
