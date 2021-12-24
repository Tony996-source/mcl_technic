---------------------------------------------------------
--------------- Wood Redefinition ---------------
---------------------------------------------------------

local logs = {

----- Name ---  Description --- planks ----- Tree 
	{"acacia",   "Acacia",   "acaciawood", "acaciatree"},
	{"birch",    "Birch",    "birchwood",  "birchtree"},
	{"dark_oak", "Dark Oak", "darkwood",   "darktree"},
	{"jungle",   "Jungle",   "junglewood", "jungletree"},
	{"oak",      "Oak",      "wood",       "tree"},
	{"spruce",   "Spruce",   "sprucewood", "sprucetree"}
}

for _, logs in pairs(logs) do

minetest.override_item("mcl_core:stripped_"..logs[1], {
    paramtype = "light",
    paramtype2 = "facedir",
	tiles = {
		"mcl_technic_worldgen_stripped_"..logs[1].."_log_top.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log_top.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375},
		}
	},
	on_place = minetest.rotate_node,
	_mcl_blast_resistance = 2,
    _mcl_hardness = 2,
})

minetest.override_item("mcl_core:stripped_"..logs[1].."_bark", {
    paramtype = "light",
    paramtype2 = "facedir",
	tiles = {
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png",
		"mcl_technic_worldgen_stripped_"..logs[1].."_log.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375},
		}
	},
	on_place = minetest.rotate_node,
	_mcl_blast_resistance = 2,
    _mcl_hardness = 2,
})

minetest.override_item("mcl_core:"..logs[4], {
	tiles = {
		"mcl_technic_worldgen_"..logs[1].."_log_top.png",
		"mcl_technic_worldgen_"..logs[1].."_log_top.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png"
	},
})

minetest.override_item("mcl_core:"..logs[4].."_bark", {
	tiles = {
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png",
		"mcl_technic_worldgen_"..logs[1].."_log.png"
	},
})

minetest.override_item("mcl_core:"..logs[3], {
	tiles = {
		"mcl_technic_worldgen_"..logs[1].."_planks.png",
		"mcl_technic_worldgen_"..logs[1].."_planks.png",
		"mcl_technic_worldgen_"..logs[1].."_planks.png",
		"mcl_technic_worldgen_"..logs[1].."_planks.png",
		"mcl_technic_worldgen_"..logs[1].."_planks.png",
		"mcl_technic_worldgen_"..logs[1].."_planks.png"
	},
})
end
