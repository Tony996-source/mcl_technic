local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

-- mcl_copper
if minetest.get_modpath("mcl_copper") then
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_copper:stone_with_copper",
	wherein         = stonelike,
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_copper:stone_with_copper",
	wherein         = stonelike,
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
end

-- mcl_Deepslate

if minetest.get_modpath("mcl_deepslate") then

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_copper",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_copper",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_coal",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_coal",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_iron",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_iron",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_gold",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_gold",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_emerald",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_emerald",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_diamond",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_diamond",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_lapis",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_deepslate:deepslate_with_lapis",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_worlds.layer_to_y(40),
	y_max          = mcl_worlds.layer_to_y(63),
})
end

-- Extra ore.

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
