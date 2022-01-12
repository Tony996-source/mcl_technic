
-- the default tube and default textures
mcl_pipeworks.register_tube("mcl_pipeworks:tube", "Pneumatic tube segment")
minetest.register_craft( {
	output = "mcl_pipeworks:tube_1 6",
	recipe = {
	        { "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
	        { "", "", "" },
	        { "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
	},
})

local nodecolor = 0xffff3030

-- the high priority tube is a low-cpu replacement for sorting tubes in situations
-- where players would use them for simple routing (turning off paths)
-- without doing actual sorting, like at outputs of tubedevices that might both accept and eject items
if mcl_pipeworks.enable_priority_tube then
	local color = "#ff3030:128"
	mcl_pipeworks.register_tube("mcl_pipeworks:priority_tube", {
			description = "High Priority Tube Segment",
			inventory_image = "mcl_pipeworks_tube_inv.png^[colorize:" .. color,
			plain = { { name = "mcl_pipeworks_tube_plain.png", color = nodecolor } },
			noctr = { { name = "mcl_pipeworks_tube_noctr.png", color = nodecolor } },
			ends  = { { name = "mcl_pipeworks_tube_end.png",   color = nodecolor } },
			short =   { name = "mcl_pipeworks_tube_short.png", color = nodecolor },
			use_texture_alpha = "clip",
			stack_max = 64,
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				tube = { priority = 150 } -- higher than tubedevices (100)
			},
	})
	minetest.register_craft( {
		output = "mcl_pipeworks:priority_tube_1 6",
		recipe = {
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
			{ "mcl_core:gold_ingot", "", "mcl_core:gold_ingot" },
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
		},
	})
	
end

if mcl_pipeworks.enable_accelerator_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:accelerator_tube", {
			description = "Accelerating Pneumatic Tube Segment",
			inventory_image = "mcl_pipeworks_accelerator_tube_inv.png",
			plain = { "mcl_pipeworks_accelerator_tube_plain.png" },
			noctr = { "mcl_pipeworks_accelerator_tube_noctr.png" },
			ends = { "mcl_pipeworks_accelerator_tube_end.png" },
			short = "mcl_pipeworks_accelerator_tube_short.png",
			use_texture_alpha = "clip",
			stack_max = 64,
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				tube = {can_go = function(pos, node, velocity, stack)
						 velocity.speed = velocity.speed+1
						 return mcl_pipeworks.notvel(mcl_pipeworks.meseadjlist, velocity)
					end}
			},
	})
	minetest.register_craft( {
		output = "mcl_pipeworks:accelerator_tube_1 2",
		recipe = {
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
			{ "mesecons:redstone", "mcl_core:iron_ingot", "mesecons:redstone" },
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
		},
	})
end

if mcl_pipeworks.enable_crossing_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:crossing_tube", {
			description = "Crossing Pneumatic Tube Segment",
			inventory_image = "mcl_pipeworks_crossing_tube_inv.png",
			plain = { "mcl_pipeworks_crossing_tube_plain.png" },
			noctr = { "mcl_pipeworks_crossing_tube_noctr.png" },
			ends = { "mcl_pipeworks_crossing_tube_end.png" },
			short = "mcl_pipeworks_crossing_tube_short.png",
			use_texture_alpha = "clip",
			stack_max = 64,
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				tube = {can_go = function(pos, node, velocity, stack) return {velocity} end }
			},
	})
	minetest.register_craft( {
		output = "mcl_pipeworks:crossing_tube_1 5",
		recipe = {
			{ "", "mcl_pipeworks:tube_1", "" },
			{ "mcl_pipeworks:tube_1", "mcl_pipeworks:tube_1", "mcl_pipeworks:tube_1" },
			{ "", "mcl_pipeworks:tube_1", "" }
		},
	})
end

if mcl_pipeworks.enable_one_way_tube then
	minetest.register_node("mcl_pipeworks:one_way_tube", {
		description = "One way tube",
		tiles = {"mcl_pipeworks_one_way_tube_top.png", "mcl_pipeworks_one_way_tube_top.png", "mcl_pipeworks_one_way_tube_output.png",
			"mcl_pipeworks_one_way_tube_input.png", "mcl_pipeworks_one_way_tube_side.png", "mcl_pipeworks_one_way_tube_top.png"},
		paramtype2 = "facedir",
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {type = "fixed",
			fixed = {{-1/2, -9/64, -9/64, 1/2, 9/64, 9/64}}},
		groups = {swordy = 2, axey = 2, handy = 1, tubedevice = 1},
		sounds = mcl_sounds.node_sound_wood_defaults(),
		_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
		tube = {
			connect_sides = {left = 1, right = 1},
			can_go = function(pos, node, velocity, stack)
				return {velocity}
			end,
			can_insert = function(pos, node, stack, direction)
				local dir = mcl_pipeworks.facedir_to_right_dir(node.param2)
				return vector.equals(dir, direction)
			end,
			priority = 75 -- Higher than normal tubes, but lower than receivers
		},
		after_place_node = mcl_pipeworks.after_place,
		after_dig_node = mcl_pipeworks.after_dig,
		on_rotate = mcl_pipeworks.on_rotate,
	})
	minetest.register_craft({
		output = "mcl_pipeworks:one_way_tube 2",
		recipe = {
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
			{ "group:stick", "mesecons:redstone", "mcl_pipeworks:plastic_sheet" },
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
		},
	})
end
