local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

-- Copper
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

-- Coal

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_coal",
		wherein         = stonelike,
		clust_scarcity = 600*3,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = mcl_worlds.layer_to_y(81),
		y_max          = mcl_worlds.layer_to_y(128),
	})
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_coal",
		wherein         = stonelike,
		clust_scarcity = 550*3,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = mcl_worlds.layer_to_y(81),
		y_max          = mcl_worlds.layer_to_y(128),
	})
	
-- Iron

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_iron",
		wherein         = stonelike,
		clust_scarcity = 830,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = mcl_vars.mg_overworld_min,
		y_max          = mcl_worlds.layer_to_y(39),
	})
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_iron",
		wherein         = stonelike,
		clust_scarcity = 1660,
		clust_num_ores = 4,
		clust_size     = 2,
		y_min          = mcl_worlds.layer_to_y(40),
		y_max          = mcl_worlds.layer_to_y(63),
	})
	
-- Gold

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_gold",
		wherein         = stonelike,
		clust_scarcity = 13000,
		clust_num_ores = 4,
		clust_size     = 2,
		y_min          = mcl_worlds.layer_to_y(31),
		y_max          = mcl_worlds.layer_to_y(33),
	})
	
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_gold",
		wherein         = stonelike,
		clust_scarcity = 13000,
		clust_num_ores = 4,
		clust_size     = 2,
		y_min          = mcl_worlds.layer_to_y(31),
		y_max          = mcl_worlds.layer_to_y(33),
	})
	
-- Diamond

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_diamond",
		wherein         = stonelike,
		clust_scarcity = 20000,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min          = mcl_worlds.layer_to_y(13),
		y_max          = mcl_worlds.layer_to_y(15),
	})
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_diamond",
		wherein         = stonelike,
		clust_scarcity = 20000,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min          = mcl_worlds.layer_to_y(13),
		y_max          = mcl_worlds.layer_to_y(15),
	})

-----------------------------------------------------------------------------------------------
----------------------------------- mcl_Deepslate----------------------------------------------
-----------------------------------------------------------------------------------------------

if minetest.get_modpath("mcl_deepslate") then

-- Copper in Deepslate

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

-- Raw Copper block

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_copper:block_raw",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})


-- Coal in Deepslate

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

-- Coal Block

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:coalblock",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})


-- Charcoal Block

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_technic:charcoalblock",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})

-- Iron in Deepslate

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

-- Raw Iron Block

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_raw_ores:raw_iron_block",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_raw_ores:raw_iron_block",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(63),
})

--Gold in Deepslate

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

-- Raw Gold Block

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_raw_ores:raw_gold_block",
	wherein         = "mcl_deepslate:deepslate",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(39),
})

-- Emerald in Deepslate

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

-- Diamond in Deepslate

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


-- Lapis in Deepslate

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

-- Nether

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
