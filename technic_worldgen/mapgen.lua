local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

-- Copper
if minetest.get_modpath("mcl_copper") then
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_copper:copper_ingot",
	wherein         = stonelike,
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_copper:copper_ingot",
	wherein         = stonelike,
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
else
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
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
end

-- Register Extra ore gen.

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(30),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(30),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(45),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_iron",
	wherein         = stonelike,
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(50),
})

minetest.register_ore({
        ore_type       = "scatter",
        ore            = "mcl_nether:quartz_ore",
        wherein         = {"mcl_nether:netherrack"},
        clust_scarcity = 1650,
        clust_num_ores = 8,
        clust_size     = 4,
        y_min = mcl_vars.mg_nether_min,
        y_max = mcl_vars.mg_nether_max,
    })
    
minetest.register_ore({
        ore_type       = "scatter",
        ore            = "mcl_nether:quartz_ore",
        wherein         = {"mcl_nether:netherrack"},
        clust_scarcity = 1650,
        clust_num_ores = 8,
        clust_size     = 4,
        y_min = mcl_vars.mg_nether_min,
        y_max = mcl_vars.mg_nether_max,
    })
