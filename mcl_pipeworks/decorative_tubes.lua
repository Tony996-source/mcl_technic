local straight = function(pos, node, velocity, stack) return {velocity} end

minetest.register_node("mcl_pipeworks:steel_block_embedded_tube", {
	description = "Airtight steelblock embedded tube",
	tiles = {
		"default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png^mcl_pipeworks_tube_connection_metallic.png",
		"default_steel_block.png^mcl_pipeworks_tube_connection_metallic.png",
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {pickaxey=1, handy = 1, tubedevice = 1},
	stack_max = 64,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
	legacy_facedir_simple = true,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	tube = {
		connect_sides = {front = 1, back = 1,},
		priority = 50,
		can_go = straight,
		can_insert = function(pos, node, stack, direction)
			local dir = minetest.facedir_to_dir(node.param2)
			return vector.equals(dir, direction) or vector.equals(vector.multiply(dir, -1), direction)
		end,
	},
	after_place_node = mcl_pipeworks.after_place,
	after_dig_node = mcl_pipeworks.after_dig,
	on_rotate = mcl_pipeworks.on_rotate,
})

minetest.register_craft( {
	output = "mcl_pipeworks:steel_block_embedded_tube 1",
	recipe = {
		{ "mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot" },
		{ "mcl_core:iron_ingot", "mcl_pipeworks:tube_1", "mcl_core:iron_ingot" },
		{ "mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot" }
	},
})

local pane_box = {
	type = "fixed",
	fixed = {
		{ -9/64, -9/64, -8/16, 9/64, 9/64, 8/16 }, -- tube
		{ -8/16, -8/16, -1/16, 8/16, 8/16, 1/16 } -- pane
	}
}
minetest.register_node("mcl_pipeworks:steel_pane_embedded_tube", {
	drawtype = "nodebox",
	description = "Airtight panel embedded tube ",
	tiles = {
		"mcl_pipeworks_pane_embedded_tube_sides.png^[transformR90",
		"mcl_pipeworks_pane_embedded_tube_sides.png^[transformR90",
		"mcl_pipeworks_pane_embedded_tube_sides.png",
		"mcl_pipeworks_pane_embedded_tube_sides.png",
		"mcl_pipeworks_pane_embedded_tube_ends.png", "mcl_pipeworks_pane_embedded_tube_ends.png",
		},
	node_box = pane_box,
	selection_box = pane_box,
	collision_box = pane_box,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {pickaxey=1, handy = 1, tubedevice = 1},
	stack_max = 64,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
	legacy_facedir_simple = true,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	tube = {
		connect_sides = {front = 1, back = 1,},
		priority = 50,
		can_go = straight,
		can_insert = function(pos, node, stack, direction)
			local dir = minetest.facedir_to_dir(node.param2)
			return vector.equals(dir, direction) or vector.equals(vector.multiply(dir, -1), direction)
		end,
	},
	after_place_node = mcl_pipeworks.after_place,
	after_dig_node = mcl_pipeworks.after_dig,
	on_rotate = mcl_pipeworks.on_rotate,
})

minetest.register_craft( {
	output = "mcl_pipeworks:steel_pane_embedded_tube 1",
	recipe = {
		{ "", "mcl_core:iron_ingot", "" },
		{ "", "mcl_pipeworks:tube_1", "" },
		{ "", "mcl_core:iron_ingot", "" }
	},
})
