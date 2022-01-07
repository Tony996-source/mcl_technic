if mcl_pipeworks.enable_detector_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:detector_tube_on", {
			description = "Detecting Pneumatic Tube Segment on (you hacker you)",
			inventory_image = "mcl_pipeworks_detector_tube_inv.png",
			plain = { "mcl_pipeworks_detector_tube_plain.png" },
			use_texture_alpha = "clip",
			stack_max = 64,
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				tube = {can_go = function(pos, node, velocity, stack)
						 local meta = minetest.get_meta(pos)
						 local name = minetest.get_node(pos).name
						 local nitems = meta:get_int("nitems")+1
						 meta:set_int("nitems", nitems)
						 local saved_pos = vector.new(pos)
						 minetest.after(detector_tube_step, minetest.registered_nodes[name].item_exit, saved_pos)
						 return mcl_pipeworks.notvel(mcl_pipeworks.meseadjlist,velocity)
					end},
				groups = {mesecon = 2, not_in_creative_inventory = 1},
				drop = "mcl_pipeworks:detector_tube_off_1",
				mesecons = {receptor = {state = "on", rules = mcl_pipeworks.mesecons_rules}},
				item_exit = function(pos)
					local meta = minetest.get_meta(pos)
					local nitems = meta:get_int("nitems")-1
					local node = minetest.get_node(pos)
					local name = node.name
					local fdir = node.param2
					if nitems == 0 then
						 minetest.set_node(pos, {name = string.gsub(name, "on", "off"), param2 = fdir})
						 mesecon.receptor_off(pos, mcl_pipeworks.mesecons_rules)
					else
						 meta:set_int("nitems", nitems)
					end
				end,
				on_construct = function(pos)
					 local meta = minetest.get_meta(pos)
					 meta:set_int("nitems", 1)
					 local name = minetest.get_node(pos).name
					 local saved_pos = vector.new(pos)
					 minetest.after(detector_tube_step, minetest.registered_nodes[name].item_exit, saved_pos)
				end,
			},
	})
	mcl_pipeworks.register_tube("mcl_pipeworks:detector_tube_off", {
			description = "Detecting Pneumatic Tube Segment",
			inventory_image = "mcl_pipeworks_detector_tube_inv.png",
			plain = { "mcl_pipeworks_detector_tube_plain.png" },
			use_texture_alpha = "clip",
			stack_max = 64,
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				tube = {can_go = function(pos, node, velocity, stack)
						local node = minetest.get_node(pos)
						local name = node.name
						local fdir = node.param2
						minetest.set_node(pos,{name = string.gsub(name, "off", "on"), param2 = fdir})
						mesecon.receptor_on(pos, mcl_pipeworks.mesecons_rules)
						return mcl_pipeworks.notvel(mcl_pipeworks.meseadjlist, velocity)
					end},
				groups = {mesecon = 2},
				mesecons = {receptor = {state = "off", rules = mcl_pipeworks.mesecons_rules }},
			},
	})

	minetest.register_craft( {
		output = "mcl_pipeworks:detector_tube_off_1 2",
		recipe = {
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
			{ "mesecons:redstone", "mcl_mobitems:slimeball", "mesecons:redstone" },
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
		},
	})
end

local digiline_enabled = minetest.get_modpath("digilines") ~= nil
if digiline_enabled and mcl_pipeworks.enable_digiline_detector_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:digiline_detector_tube", {
			description = "Digiline Detecting Pneumatic Tube Segment",
			inventory_image = "mcl_pipeworks_digiline_detector_tube_inv.png",
			plain = { "mcl_pipeworks_digiline_detector_tube_plain.png" },
			node_def = {
				tube = {can_go = function(pos, node, velocity, stack)
						local meta = minetest.get_meta(pos)

						local setchan = meta:get_string("channel")

						digiline:receptor_send(pos, digiline.rules.default, setchan, stack:to_string())

						return mcl_pipeworks.notvel(mcl_pipeworks.meseadjlist, velocity)
					end},
				on_construct = function(pos)
					local meta = minetest.get_meta(pos)
					meta:set_string("formspec",
						"size[8.6,2.2]"..
						"field[0.6,0.6;8,1;channel;Channel:;${channel}]"..
						"image[0.3,1.3;1,1;mcl_pipeworks_digiline_detector_tube_inv.png]"..
						"label[1.6,1.2;Digiline Detecting Tube]"
					)
				end,
				on_receive_fields = function(pos, formname, fields, sender)
					if fields.channel then
						minetest.get_meta(pos):set_string("channel", fields.channel)
					end
				end,
				groups = {},
				digiline = {
					receptor = {},
					effector = {
						action = function(pos,node,channel,msg) end
					},
					wire = {
						rules = mcl_pipeworks.digilines_rules
					},
				},
			},
	})

	minetest.register_craft( {
		output = "mcl_pipeworks:digiline_detector_tube_1 2",
		recipe = {
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" },
			{ "digilines:wire_std_00000000", "mcl_mobitems:slimeball", "digilines:wire_std_00000000" },
			{ "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet", "mcl_pipeworks:plastic_sheet" }
		},
	})
end

if mcl_pipeworks.enable_conductor_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:conductor_tube_off", {
			description = "Conducting Pneumatic Tube Segment",
			inventory_image = "mcl_pipeworks_conductor_tube_inv.png",
			short = "mcl_pipeworks_conductor_tube_short.png",
			plain = { "mcl_pipeworks_conductor_tube_plain.png" },
			noctr = { "mcl_pipeworks_conductor_tube_noctr.png" },
			ends = { "mcl_pipeworks_conductor_tube_end.png" },
			use_texture_alpha = "clip",
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				groups = {mesecon = 2},
				mesecons = {conductor = {state = "off",
							  rules = mcl_pipeworks.mesecons_rules,
							  onstate = "mcl_pipeworks:conductor_tube_on_#id"}}
			},
	})
	mcl_pipeworks.register_tube("mcl_pipeworks:conductor_tube_on", {
			description = "Conducting Pneumatic Tube Segment on (you hacker you)",
			inventory_image = "mcl_pipeworks_conductor_tube_inv.png",
			short = "mcl_pipeworks_conductor_tube_short.png",
			plain = { "mcl_pipeworks_conductor_tube_on_plain.png" },
			noctr = { "mcl_pipeworks_conductor_tube_on_noctr.png" },
			ends = { "mcl_pipeworks_conductor_tube_on_end.png" },
			use_texture_alpha = "clip",
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				groups = {mesecon = 2, not_in_creative_inventory = 1},
				drop = "mcl_pipeworks:conductor_tube_off_1",
				mesecons = {conductor = {state = "on",
							  rules = mcl_pipeworks.mesecons_rules,
							  offstate = "mcl_pipeworks:conductor_tube_off_#id"}}
			},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "mcl_pipeworks:conductor_tube_off_1",
		recipe = {"mcl_pipeworks:tube_1", "mesecons:redstone"}
	})
end

if digiline_enabled and mcl_pipeworks.enable_digiline_conductor_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:digiline_conductor_tube", {
		description = "Digiline Conducting Pneumatic Tube Segment",
		inventory_image = "mcl_pipeworks_tube_inv.png^mcl_pipeworks_digiline_conductor_tube_inv.png",
		short = "mcl_pipeworks_tube_short.png^mcl_pipeworks_digiline_conductor_tube_short.png",
		plain = {"mcl_pipeworks_tube_plain.png^mcl_pipeworks_digiline_conductor_tube_plain.png"},
		noctr = {"mcl_pipeworks_tube_noctr.png^mcl_pipeworks_digiline_conductor_tube_noctr.png"},
		ends = {"mcl_pipeworks_tube_end.png^mcl_pipeworks_digiline_conductor_tube_end.png"},
		node_def = {digiline = {wire = {rules = mcl_pipeworks.digilines_rules}}},
	})
	minetest.register_craft({
		type = "shapeless",
		output = "mcl_pipeworks:digiline_conductor_tube_1",
		recipe = {"mcl_pipeworks:tube_1", "digilines:wire_std_00000000"}
	})
end

if digiline_enabled and mcl_pipeworks.enable_digiline_conductor_tube and
		mcl_pipeworks.enable_conductor_tube then
	mcl_pipeworks.register_tube("mcl_pipeworks:mesecon_and_digiline_conductor_tube_off", {
		description = "Mesecon and Digiline Conducting Pneumatic Tube Segment",
		inventory_image = "mcl_pipeworks_conductor_tube_inv.png^mcl_pipeworks_digiline_conductor_tube_inv.png",
		short = "mcl_pipeworks_conductor_tube_short.png^mcl_pipeworks_digiline_conductor_tube_short.png",
		plain = {"mcl_pipeworks_conductor_tube_plain.png^mcl_pipeworks_digiline_conductor_tube_plain.png"},
		noctr = {"mcl_pipeworks_conductor_tube_noctr.png^mcl_pipeworks_digiline_conductor_tube_noctr.png"},
		ends = {"mcl_pipeworks_conductor_tube_end.png^mcl_pipeworks_digiline_conductor_tube_end.png"},
		use_texture_alpha = "clip",
		_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
		node_def = {
			digiline = {wire = {rules = mcl_pipeworks.digilines_rules}},
			groups = {mesecon = 2},
			mesecons = {conductor = {
				state = "off",
				rules = mcl_pipeworks.mesecons_rules,
				onstate = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_on_#id"
			}},
		},
	})
	mcl_pipeworks.register_tube("mcl_pipeworks:mesecon_and_digiline_conductor_tube_on", {
		description = "Mesecon and Digiline Conducting Pneumatic Tube Segment on (you hacker you)",
		inventory_image = "mcl_pipeworks_conductor_tube_inv.png^mcl_pipeworks_digiline_conductor_tube_inv.png",
		short = "mcl_pipeworks_conductor_tube_short.png^mcl_pipeworks_digiline_conductor_tube_short.png",
		plain = {"mcl_pipeworks_conductor_tube_on_plain.png^mcl_pipeworks_digiline_conductor_tube_plain.png"},
		noctr = {"mcl_pipeworks_conductor_tube_on_noctr.png^mcl_pipeworks_digiline_conductor_tube_noctr.png"},
		ends = {"mcl_pipeworks_conductor_tube_on_end.png^mcl_pipeworks_digiline_conductor_tube_end.png"},
		use_texture_alpha = "clip",
		_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
		node_def = {
			digiline = {wire = {rules = mcl_pipeworks.digilines_rules}},
			groups = {mesecon = 2, not_in_creative_inventory = 1},
			drop = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_off_1",
			mesecons = {conductor = {
				state = "on",
				rules = mcl_pipeworks.mesecons_rules,
				offstate = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_off_#id"}
			},
		},
	})
	minetest.register_craft({
		type = "shapeless",
		output = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_off_1",
		recipe = {"mcl_pipeworks:tube_1", "mesecons:redstone", "digilines:wire_std_00000000"}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_off_1",
		recipe = {"mcl_pipeworks:conductor_tube_off_1", "digilines:wire_std_00000000"}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "mcl_pipeworks:mesecon_and_digiline_conductor_tube_off_1",
		recipe = {"mcl_pipeworks:digiline_conductor_tube_1", "mesecons:redstone"}
	})
end
