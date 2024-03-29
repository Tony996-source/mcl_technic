minetest.register_node("mcl_pipeworks:trashcan", {
	description = "Trash Can", 
	drawtype = "nodebox", 
	tiles = {
		"mcl_pipeworks_trashcan_top.png",
		"mcl_pipeworks_trashcan_bottom.png",
		"mcl_pipeworks_trashcan_side.png",
		"mcl_pipeworks_trashcan_side.png",
		"mcl_pipeworks_trashcan_side.png",
		"mcl_pipeworks_trashcan_side.png"
	}, 
	groups = {pickaxey=1, axey=1, swordy=1, handy=1, tubedevice = 1, tubedevice_receiver = 1}, 
	stack_max = 64,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, -0.375, 0.5, 0.375},
			{0.375, -0.5, -0.375, 0.5, 0.5, 0.375},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375},
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
			{-0.375, -0.5, -0.375, 0.375, 0.375, 0.375},
		},
	},
	selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
	tube = {
		insert_object = function(pos, node, stack, direction)
			return ItemStack("")
		end,
		connect_sides = {left = 1, right = 1, front = 1, back = 1, top = 1, bottom = 1},
		priority = 1, -- Lower than anything else
	}, 
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[9,7]"..
				"item_image[0,0;1,1;mcl_pipeworks:trashcan]"..
				"label[1,0;Trash Can]"..
				"list[context;trash;3.5,1;1,1;]"..
				mcl_formspec.get_itemslot_bg(3.5,1,1,1)..
		"list[current_player;main;0,3;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,3,9,3)..
	    "list[current_player;main;0,6;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,6,9,1)..
				"listring[context;trash]" ..
				"listring[current_player;main]"
				)
		meta:set_string("infotext", "Trash Can")
		meta:get_inventory():set_size("trash", 1)
	end, 
	after_place_node = mcl_pipeworks.after_place,
	after_dig_node = mcl_pipeworks.after_dig,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.get_meta(pos):get_inventory():set_stack(listname, index, ItemStack(""))
	end,
})

minetest.register_craft({
	output = "mcl_pipeworks:trashcan",
	recipe = {
		{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
		{ "group:wood", "", "group:wood" },
		{ "group:wood", "group:wood", "group:wood" },
	},
})
