local S = mcl_technic.getter

local fs_helpers = mcl_pipeworks.fs_helpers
local tube_entry = "^mcl_pipeworks_tube_connection_metallic.png"

local tube = {
	insert_object = function(pos, node, stack, direction)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:add_item("src", stack)
	end,
	can_insert = function(pos, node, stack, direction)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if meta:get_int("splitstacks") == 1 then
			stack = stack:peek_item(1)
		end
		return inv:room_for_item("src", stack)
	end,
	connect_sides = {left=1, right=1, back=1, top=1, bottom=1},
}

function mcl_technic.register_generator(data)

	local tier = data.tier
	local ltier = string.lower(tier)

	local groups = {pickaxey=1,axey=1, handy=1, swordy=1,
		mcl_technic_machine=1, ["mcl_technic_"..ltier]=1}
	if data.tube then
		groups.tubedevice = 1
		groups.tubedevice_receiver = 1
	end
	local active_groups = {not_in_creative_inventory = 1}
	for k, v in pairs(groups) do active_groups[k] = v end

	local generator_formspec =
		"size[9,9;]"..
		"label[0,0;"..S("Fuel-Fired %s Generator"):format(tier).."]"..
		"list[current_name;src;3,1;1,1;]"..
		mcl_formspec.get_itemslot_bg(3,1,1,1)..
		"image[4,1;1,1;default_furnace_fire_bg.png]"..
		"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"
	
	local desc = S("Fuel-Fired %s Generator"):format(tier)
	
	local run = function(pos, node)
		local meta = minetest.get_meta(pos)
		local burn_time = meta:get_int("burn_time")
		local burn_totaltime = meta:get_int("burn_totaltime")
		-- If more to burn and the energy produced was used: produce some more
		if burn_time > 0 then
			meta:set_int(tier.."_EU_supply", data.supply)
			burn_time = burn_time - 1
			meta:set_int("burn_time", burn_time)
		end
		-- Burn another piece of fuel
		if burn_time == 0 then
			local inv = meta:get_inventory()
			if not inv:is_empty("src") then 
				local fuellist = inv:get_list("src")
				local fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result(
						{method = "fuel", width = 1,
						items = fuellist})
				if not fuel or fuel.time == 0 then
					meta:set_string("infotext", S("%s Out Of Fuel"):format(desc))
					mcl_technic.swap_node(pos, "mcl_technic:"..ltier.."_generator")
					meta:set_int(tier.."_EU_supply", 0)
					return
				end
				meta:set_int("burn_time", fuel.time)
				meta:set_int("burn_totaltime", fuel.time)
				inv:set_stack("src", 1, afterfuel.items[1])
				mcl_technic.swap_node(pos, "mcl_technic:"..ltier.."_generator_active")
				meta:set_int(tier.."_EU_supply", data.supply)
			else
				mcl_technic.swap_node(pos, "mcl_technic:"..ltier.."_generator")
				meta:set_int(tier.."_EU_supply", 0)
			end
		end
		if burn_totaltime == 0 then burn_totaltime = 1 end
		local percent = math.floor((burn_time / burn_totaltime) * 100)
		meta:set_string("infotext", desc.." ("..percent.."%)")

		local form_buttons = ""
		if ltier ~= "lv" then
			form_buttons = fs_helpers.cycling_button(
				meta,
				mcl_pipeworks.button_base,
				"splitstacks",
				{
					mcl_pipeworks.button_off,
					mcl_pipeworks.button_on
				}
			)..mcl_pipeworks.button_label
		end
		meta:set_string("formspec", 
			"size[9, 9]"..
			"label[0, 0;"..minetest.formspec_escape(desc).."]"..
			"list[current_name;src;3, 1;1, 1;]"..
			mcl_formspec.get_itemslot_bg(3,1,1,1)..
			"image[4, 1;1, 1;default_furnace_fire_bg.png^[lowpart:"..
			(percent)..":default_furnace_fire_fg.png]"..
		"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
			"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
			form_buttons
		)
	end

	local tentry = tube_entry
	if ltier == "lv" then tentry = "" end

	minetest.register_node("mcl_technic:"..ltier.."_generator", {
		description = desc,
		tiles = {
				"mcl_technic_"..ltier.."_generator_top.png",
				"mcl_technic_"..ltier.."_generator_top.png",
				"mcl_technic_"..ltier.."_generator_side.png"..tentry,
				"mcl_technic_"..ltier.."_generator_side.png"..tentry,
				"mcl_technic_"..ltier.."_generator_side.png"..tentry,
				"mcl_technic_"..ltier.."_generator_front.png"
		}, 
		paramtype2 = "facedir",
		groups = groups,
		connect_sides = {"bottom", "back", "left", "right"},
		legacy_facedir_simple = true,
		sounds = mcl_sounds.node_sound_wood_defaults(),
		_mcl_blast_resistance = 6,
	    _mcl_hardness = 1.5,
		tube = data.tube and tube or nil,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			meta:set_string("infotext", desc)
			meta:set_int(data.tier.."_EU_supply", 0)
			meta:set_int("burn_time", 0)
			meta:set_int("tube_time",  0)
			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
						meta,
						mcl_pipeworks.button_base,
						"splitstacks",
						{
							mcl_pipeworks.button_off,
							mcl_pipeworks.button_on
						}
					)..mcl_pipeworks.button_label
			end
			meta:set_string("formspec", generator_formspec..form_buttons)
			local inv = meta:get_inventory()
			inv:set_size("src", 1)
		end,
		can_dig = mcl_technic.machine_can_dig,
		allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
		allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
		allow_metadata_inventory_move = mcl_technic.machine_inventory_move,
		mcl_technic_run = run,
		after_place_node = data.tube and mcl_pipeworks.after_place,
		after_dig_node = mcl_technic.machine_after_dig_node,
		on_receive_fields = function(pos, formname, fields, sender)
			if not mcl_pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			local form = generator_formspec
			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
						meta,
						mcl_pipeworks.button_base,
						"splitstacks",
						{
							mcl_pipeworks.button_off,
							mcl_pipeworks.button_on
						}
					)..mcl_pipeworks.button_label
			end
			meta:set_string("formspec", generator_formspec..form_buttons)
		end,
	})

	minetest.register_node("mcl_technic:"..ltier.."_generator_active", {
		description = desc,
		tiles = {
			"mcl_technic_"..ltier.."_generator_top.png",
			"mcl_technic_"..ltier.."_generator_top.png",
			"mcl_technic_"..ltier.."_generator_side.png"..tube_entry,
			"mcl_technic_"..ltier.."_generator_side.png"..tube_entry,
			"mcl_technic_"..ltier.."_generator_side.png"..tube_entry,
			"mcl_technic_"..ltier.."_generator_front_active.png"
		},
		paramtype2 = "facedir",
		groups = active_groups,
		connect_sides = {"bottom"},
		legacy_facedir_simple = true,
		sounds = mcl_sounds.node_sound_wood_defaults(),
		_mcl_blast_resistance = 6,
	    _mcl_hardness = 1.5,
		tube = data.tube and tube or nil,
		drop = "mcl_technic:"..ltier.."_generator",
		can_dig = mcl_technic.machine_can_dig,
		after_dig_node = mcl_technic.machine_after_dig_node,
		allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
		allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
		allow_metadata_inventory_move = mcl_technic.machine_inventory_move,
		mcl_technic_run = run,
		mcl_technic_on_disable = function(pos, node)
			local timer = minetest.get_node_timer(pos)
        		timer:start(1)
        	end,
		on_timer = function(pos, node)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)

			-- Connected back?
			if meta:get_int(tier.."_EU_timeout") > 0 then return false end
			
			local burn_time = meta:get_int("burn_time") or 0

			if burn_time <= 0 then
				meta:set_int(tier.."_EU_supply", 0)
				meta:set_int("burn_time", 0)
				mcl_technic.swap_node(pos, "mcl_technic:"..ltier.."_generator")
				return false
			end

			local burn_totaltime = meta:get_int("burn_totaltime") or 0
			if burn_totaltime == 0 then burn_totaltime = 1 end
			burn_time = burn_time - 1
			meta:set_int("burn_time", burn_time)
			local percent = math.floor(burn_time / burn_totaltime * 100)

			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
					meta,
					mcl_pipeworks.button_base,
					"splitstacks",
					{
						mcl_pipeworks.button_off,
						mcl_pipeworks.button_on
					}
				)..mcl_pipeworks.button_label
			end
			meta:set_string("formspec", 
				"size[9, 9]"..
				"label[0, 0;"..minetest.formspec_escape(desc).."]"..
				"list[current_name;src;3, 1;1, 1;]"..
				mcl_formspec.get_itemslot_bg(3,1,1,1)..
				"image[4, 1;1, 1;default_furnace_fire_bg.png^[lowpart:"..
				(percent)..":default_furnace_fire_fg.png]"..
		"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
				"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
				form_buttons
			)
			return true
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			if not mcl_pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local meta = minetest.get_meta(pos)
			local node = minetest.get_node(pos)
			local form_buttons = ""
			if not string.find(node.name, ":lv_") then
				form_buttons = fs_helpers.cycling_button(
						meta,
						mcl_pipeworks.button_base,
						"splitstacks",
						{
							mcl_pipeworks.button_off,
							mcl_pipeworks.button_on
						}
					)..mcl_pipeworks.button_label
			end

			local burn_totaltime = meta:get_int("burn_totaltime") or 0
			local burn_time = meta:get_int("burn_time")
			local percent = math.floor(burn_time / burn_totaltime * 100)

			meta:set_string("formspec", 
				"size[9, 9]"..
				"label[0, 0;"..minetest.formspec_escape(desc).."]"..
				"list[current_name;src;3, 1;1, 1;]"..
				mcl_formspec.get_itemslot_bg(3,1,1,1)..
				"image[4, 1;1, 1;default_furnace_fire_bg.png^[lowpart:"..
				(percent)..":default_furnace_fire_fg.png]"..
		"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
				"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
				form_buttons
			)
		end,
	})

	mcl_technic.register_machine(tier, "mcl_technic:"..ltier.."_generator",        mcl_technic.producer)
	mcl_technic.register_machine(tier, "mcl_technic:"..ltier.."_generator_active", mcl_technic.producer)
end

