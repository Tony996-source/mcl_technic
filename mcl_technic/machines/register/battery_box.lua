
local digilines_path = minetest.get_modpath("digilines")

local S = mcl_technic.getter
local tube_entry = "^mcl_pipeworks_tube_connection_metallic.png"
local cable_entry = "^mcl_technic_cable_connection_overlay.png"

local fs_helpers = mcl_pipeworks.fs_helpers

mcl_technic.register_power_tool("mcl_technic:battery", 10000)

-- Battery recipes:
-- Iron - Gold recipe:
minetest.register_craft({
	output = "mcl_technic:battery",
	recipe = {
		{"group:wood", "mcl_core:iron_ingot", "group:wood"},
		{"group:wood", "mcl_core:gold_ingot",    "group:wood"},
		{"group:wood", "mcl_core:iron_ingot", "group:wood"},
	}
})

minetest.register_tool("mcl_technic:battery", {
	description = S("RE Battery"),
	inventory_image = "mcl_technic_battery.png",
	wear_represents = "mcl_technic_RE_charge",
	on_refill = mcl_technic.refill_RE_charge,
	tool_capabilities = {
		charge = 0,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={}, uses=10000, maxlevel=0}
		}
	}
})

-- x+2 + (z+2)*2
local dirtab = {
	[4] = 2,
	[5] = 3,
	[7] = 1,
	[8] = 0
}

local tube = {
	insert_object = function(pos, node, stack, direction)
		print(minetest.pos_to_string(direction), dirtab[direction.x+2+(direction.z+2)*2], node.param2)
		if direction.y == 1
			or (direction.y == 0 and dirtab[direction.x+2+(direction.z+2)*2] == node.param2) then
			return stack
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if direction.y == 0 then
			return inv:add_item("src", stack)
		else
			return inv:add_item("dst", stack)
		end
	end,
	can_insert = function(pos, node, stack, direction)
		print(minetest.pos_to_string(direction), dirtab[direction.x+2+(direction.z+2)*2], node.param2)
		if direction.y == 1
			or (direction.y == 0 and dirtab[direction.x+2+(direction.z+2)*2] == node.param2) then
			return false
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if direction.y == 0 then
			if meta:get_int("split_src_stacks") == 1 then
				stack = stack:peek_item(1)
			end
			return inv:room_for_item("src", stack)
		else
			if meta:get_int("split_dst_stacks") == 1 then
				stack = stack:peek_item(1)
			end
			return inv:room_for_item("dst", stack)
		end
	end,
	connect_sides = {left=1, right=1, back=1, top=1},
}

local function add_on_off_buttons(meta, ltier, charge_percent)
	local formspec = ""
	if ltier == "mv" or ltier == "hv" then
		formspec = "image[1,1;1,2;mcl_technic_power_meter_bg.png"
			.."^[lowpart:"..charge_percent
			..":mcl_technic_power_meter_fg.png]"..
			fs_helpers.cycling_button(
				meta,
				"image_button[3,2.0;1,0.6",
				"split_src_stacks",
				{
					mcl_pipeworks.button_off,
					mcl_pipeworks.button_on
				}
			).."label[3.9,2.01;Allow splitting incoming 'charge' stacks from tubes]"..
			fs_helpers.cycling_button(
				meta,
				"image_button[3,2.5;1,0.6",
				"split_dst_stacks",
				{
					mcl_pipeworks.button_off,
					mcl_pipeworks.button_on
				}
			).."label[3.9,2.51;Allow splitting incoming 'discharge' stacks]"
	end
	return formspec
end

function mcl_technic.register_battery_box(data)
	local tier = data.tier
	local ltier = string.lower(tier)

	local formspec =
		"size[9,9]"..
		"image[1,1;1,2;mcl_technic_power_meter_bg.png]"..
		"list[context;src;3,1;1,1;]"..
		mcl_formspec.get_itemslot_bg(3,1,1,1)..
		"image[4,1;1,1;mcl_technic_battery_reload.png]"..
		"list[context;dst;5,1;1,1;]"..
		mcl_formspec.get_itemslot_bg(5,1,1,1)..
		"label[0,0;"..S("%s Battery Box"):format(tier).."]"..
		"label[3,0;"..S("Charge").."]"..
		"label[5,0;"..S("Discharge").."]"..
		"label[1,3;"..S("Power level").."]"..
				"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
	    "listring[current_player;main]"..
		"listring[context;src]"..
		"listring[current_player;main]"..
		"listring[context;dst]"..
		"listring[current_player;main]"

	if digilines_path then
		formspec = formspec.."button[0.6,3.7;2,1;edit_channel;edit Channel]"
	end

	if data.upgrade then
		formspec = formspec..
			"list[context;upgrade1;3.5,3;1,1;]"..
			mcl_formspec.get_itemslot_bg(3.5,3,1,1)..
			"list[context;upgrade2;4.5,3;1,1;]"..
			mcl_formspec.get_itemslot_bg(4.5,3,1,1,1)..
			"label[3.5,4;"..S("Upgrade Slots").."]"..
			"listring[context;upgrade1]"..
			"listring[current_player;main]"..
			"listring[context;upgrade2]"..
			"listring[current_player;main]"
	end

	local run = function(pos, node)
		local below = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local meta           = minetest.get_meta(pos)

		if not mcl_technic.is_tier_cable(below.name, tier) then
			meta:set_string("infotext", S("%s Battery Box Has No Network"):format(tier))
			return
		end

		local eu_input       = meta:get_int(tier.."_EU_input")
		local current_charge = meta:get_int("internal_EU_charge")

		local EU_upgrade, tube_upgrade = 0, 0
		if data.upgrade then
			EU_upgrade, tube_upgrade = mcl_technic.handle_machine_upgrades(meta)
		end
		local max_charge = data.max_charge * (1 + EU_upgrade / 10)

		-- Charge/discharge the battery with the input EUs
		if eu_input >= 0 then
			current_charge = math.min(current_charge + eu_input, max_charge)
		else
			current_charge = math.max(current_charge + eu_input, 0)
		end

		-- Charging/discharging tools here
		local tool_full, tool_empty
		current_charge, tool_full = mcl_technic.charge_tools(meta,
				current_charge, data.charge_step)
		current_charge, tool_empty = mcl_technic.discharge_tools(meta,
				current_charge, data.discharge_step,
				max_charge)

		if data.tube then
			local inv = meta:get_inventory()
			mcl_technic.handle_machine_mcl_pipeworks(pos, tube_upgrade,
			function(pos, x_velocity, z_velocity)
				if tool_full and not inv:is_empty("src") then
					mcl_technic.send_items(pos, x_velocity, z_velocity, "src")
				elseif tool_empty and not inv:is_empty("dst") then
					mcl_technic.send_items(pos, x_velocity, z_velocity, "dst")
				end
			end)
		end

		-- We allow batteries to charge on less than the demand
		meta:set_int(tier.."_EU_demand",
				math.min(data.charge_rate, max_charge - current_charge))
		meta:set_int(tier.."_EU_supply",
				math.min(data.discharge_rate, current_charge))
			meta:set_int("internal_EU_charge", current_charge)

		-- Select node textures
		local charge_count = math.ceil((current_charge / max_charge) * 8)
		charge_count = math.min(charge_count, 8)
		charge_count = math.max(charge_count, 0)
		local last_count = meta:get_float("last_side_shown")
		if charge_count ~= last_count then
			mcl_technic.swap_node(pos,"mcl_technic:"..ltier.."_battery_box"..charge_count)
			meta:set_float("last_side_shown", charge_count)
		end

		local charge_percent = math.floor(current_charge / max_charge * 100)
		meta:set_string("formspec", formspec..add_on_off_buttons(meta, ltier, charge_percent))
		local infotext = S("@1 Battery Box: @2 / @3", tier,
				mcl_technic.EU_string(current_charge),
				mcl_technic.EU_string(max_charge))
		if eu_input == 0 then
			infotext = S("%s Idle"):format(infotext)
		end
		meta:set_string("infotext", infotext)
	end

	for i = 0, 8 do
		local groups = {pickaxey=1,axey=1, handy=1, swordy=1,
				mcl_technic_machine=1, ["mcl_technic_"..ltier]=1}
		if i ~= 0 then
			groups.not_in_creative_inventory = 1
		end

		if data.tube then
			groups.tubedevice = 1
			groups.tubedevice_receiver = 1
		end

		local top_tex = "mcl_technic_"..ltier.."_battery_box_top.png"
		local front_tex = "mcl_technic_"..ltier.."_battery_box_front.png^mcl_technic_power_meter"..i..".png"
		local side_tex = "mcl_technic_"..ltier.."_battery_box_side.png"..tube_entry
		local bottom_tex = "mcl_technic_"..ltier.."_battery_box_bottom.png"..cable_entry

		if ltier == "lv" then
			top_tex = "mcl_technic_"..ltier.."_battery_box_top.png"
			front_tex = "mcl_technic_"..ltier.."_battery_box_front.png^mcl_technic_power_meter"..i..".png"
			side_tex = "mcl_technic_"..ltier.."_battery_box_side.png"
		end

		minetest.register_node("mcl_technic:"..ltier.."_battery_box"..i, {
			description = S("%s Battery Box"):format(tier),
			tiles = {
				top_tex,
				bottom_tex,
				side_tex,
				side_tex,
				side_tex,
				front_tex},
			groups = groups,
			connect_sides = {"bottom"},
			tube = data.tube and tube or nil,
			paramtype2 = "facedir",
			sounds = mcl_sounds.node_sound_wood_defaults(),
			_mcl_blast_resistance = 6,
	        _mcl_hardness = 1.5,
			drop = "mcl_technic:"..ltier.."_battery_box0",
			on_construct = function(pos)
				local meta = minetest.get_meta(pos)
				local EU_upgrade, tube_upgrade = 0, 0
				if data.upgrade then
					EU_upgrade, tube_upgrade = mcl_technic.handle_machine_upgrades(meta)
				end
				local max_charge = data.max_charge * (1 + EU_upgrade / 10)
				local charge = meta:get_int("internal_EU_charge")
				local cpercent = math.floor(charge / max_charge * 100)
				local inv = meta:get_inventory()
				local node = minetest.get_node(pos)
				meta:set_string("infotext", S("%s Battery Box"):format(tier))
				meta:set_string("formspec", formspec..add_on_off_buttons(meta, ltier, cpercent))
				meta:set_string("channel", ltier.."_battery_box"..minetest.pos_to_string(pos))
				meta:set_int(tier.."_EU_demand", 0)
				meta:set_int(tier.."_EU_supply", 0)
				meta:set_int(tier.."_EU_input",  0)
				meta:set_float("internal_EU_charge", 0)
				inv:set_size("src", 1)
				inv:set_size("dst", 1)
				inv:set_size("upgrade1", 1)
				inv:set_size("upgrade2", 1)
			end,
			can_dig = mcl_technic.machine_can_dig,
			allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
			allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
			allow_metadata_inventory_move = mcl_technic.machine_inventory_move,
			mcl_technic_run = run,
			on_rotate = screwdriver.rotate_simple,
			after_place_node = data.tube and mcl_pipeworks.after_place,
			after_dig_node = mcl_technic.machine_after_dig_node,
			on_receive_fields = function(pos, formname, fields, sender)
				local meta = minetest.get_meta(pos)
				local nodename = minetest.get_node(pos).name
				if fields.edit_channel then
					minetest.show_formspec(sender:get_player_name(),
						"mcl_technic:battery_box_edit_channel"..minetest.pos_to_string(pos),
						"field[channel;Digiline Channel;"..meta:get_string("channel").."]")
				elseif fields["fs_helpers_cycling:0:split_src_stacks"]
				  or   fields["fs_helpers_cycling:0:split_dst_stacks"]
				  or   fields["fs_helpers_cycling:1:split_src_stacks"]
				  or   fields["fs_helpers_cycling:1:split_dst_stacks"] then
					local meta = minetest.get_meta(pos)
					if not mcl_pipeworks.may_configure(pos, sender) then return end
					fs_helpers.on_receive_fields(pos, fields)
					local EU_upgrade, tube_upgrade = 0, 0
					if data.upgrade then
						EU_upgrade, tube_upgrade = mcl_technic.handle_machine_upgrades(meta)
					end
					local max_charge = data.max_charge * (1 + EU_upgrade / 10)
					local charge = meta:get_int("internal_EU_charge")
					local cpercent = math.floor(charge / max_charge * 100)
					meta:set_string("formspec", formspec..add_on_off_buttons(meta, ltier, cpercent))
				end
			end,
			digiline = {
				receptor = {action = function() end},
				effector = {
					action = function(pos, node, channel, msg)
						if msg ~= "GET" and msg ~= "get" then
							return
						end
						local meta = minetest.get_meta(pos)
						if channel ~= meta:get_string("channel") then
							return
						end
						local inv = meta:get_inventory()
						digilines.receptor_send(pos, digilines.rules.default, channel, {
							demand = meta:get_int(tier.."_EU_demand"),
							supply = meta:get_int(tier.."_EU_supply"),
							input  = meta:get_int(tier.."_EU_input"),
							charge = meta:get_int("internal_EU_charge"),
							max_charge = data.max_charge * (1 + mcl_technic.handle_machine_upgrades(meta) / 10),
							src      = inv:get_stack("src", 1):to_table(),
							dst      = inv:get_stack("dst", 1):to_table(),
							upgrade1 = inv:get_stack("upgrade1", 1):to_table(),
							upgrade2 = inv:get_stack("upgrade2", 1):to_table()
						})
					end
				},
			},
		})
	end

	-- Register as a battery type
	-- Battery type machines function as power reservoirs and can both receive and give back power
	for i = 0, 8 do
		mcl_technic.register_machine(tier, "mcl_technic:"..ltier.."_battery_box"..i, mcl_technic.battery)
	end

end -- End registration

minetest.register_on_player_receive_fields(
	function(player, formname, fields)
		if formname:sub(1, 32) ~= "mcl_technic:battery_box_edit_channel" or
				not fields.channel then
			return
		end
		local pos = minetest.string_to_pos(formname:sub(33))
		local plname = player:get_player_name()
		if minetest.is_protected(pos, plname) then
			minetest.record_protection_violation(pos, plname)
			return
		end
		local meta = minetest.get_meta(pos)
		meta:set_string("channel", fields.channel)
	end
)

function mcl_technic.charge_tools(meta, batt_charge, charge_step)
	local inv = meta:get_inventory()
	if inv:is_empty("src") then
		return batt_charge, false
	end
	local src_stack = inv:get_stack("src", 1)

	local tool_name = src_stack:get_name()
	if not mcl_technic.power_tools[tool_name] then
		return batt_charge, false
	end
	-- Set meta data for the tool if it didn't do it itself
	local src_meta = minetest.deserialize(src_stack:get_metadata()) or {}
	if not src_meta.charge then
		src_meta.charge = 0
	end
	-- Do the charging
	local item_max_charge = mcl_technic.power_tools[tool_name]
	local tool_charge     = src_meta.charge
	if tool_charge >= item_max_charge then
		return batt_charge, true
	elseif batt_charge <= 0 then
		return batt_charge, false
	end
	charge_step = math.min(charge_step, batt_charge)
	charge_step = math.min(charge_step, item_max_charge - tool_charge)
	tool_charge = tool_charge + charge_step
	batt_charge = batt_charge - charge_step
	mcl_technic.set_RE_wear(src_stack, tool_charge, item_max_charge)
	src_meta.charge = tool_charge
	src_stack:set_metadata(minetest.serialize(src_meta))
	inv:set_stack("src", 1, src_stack)
	return batt_charge, (tool_charge == item_max_charge)
end


function mcl_technic.discharge_tools(meta, batt_charge, charge_step, max_charge)
	local inv = meta:get_inventory()
	if inv:is_empty("dst") then
		return batt_charge, false
	end
	srcstack = inv:get_stack("dst", 1)
	local toolname = srcstack:get_name()
	if mcl_technic.power_tools[toolname] == nil then
		return batt_charge, false
	end
	-- Set meta data for the tool if it didn't do it itself :-(
	local src_meta = minetest.deserialize(srcstack:get_metadata())
	src_meta = src_meta or {}
	if not src_meta.charge then
		src_meta.charge = 0
	end

	-- Do the discharging
	local item_max_charge = mcl_technic.power_tools[toolname]
	local tool_charge     = src_meta.charge
	if tool_charge <= 0 then
		return batt_charge, true
	elseif batt_charge >= max_charge then
		return batt_charge, false
	end
	charge_step = math.min(charge_step, max_charge - batt_charge)
	charge_step = math.min(charge_step, tool_charge)
	tool_charge = tool_charge - charge_step
	batt_charge = batt_charge + charge_step
	mcl_technic.set_RE_wear(srcstack, tool_charge, item_max_charge)
	src_meta.charge = tool_charge
	srcstack:set_metadata(minetest.serialize(src_meta))
	inv:set_stack("dst", 1, srcstack)
	return batt_charge, (tool_charge == 0)
end

