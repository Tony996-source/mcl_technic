
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
	connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
}

local connect_default = {"bottom", "back", "left", "right"}

local function round(v)
	return math.floor(v + 0.5)
end

function mcl_technic.register_base_machine(data)
	local typename = data.typename
	local input_size = mcl_technic.recipes[typename].input_size
	local machine_name = data.machine_name
	local machine_desc = data.machine_desc
	local tier = data.tier
	local ltier = string.lower(tier)

	local groups = {pickaxey=1,axey=1, handy=1, swordy=1, mcl_technic_machine = 1, ["mcl_technic_"..ltier] = 1, xp=10}
	if data.tube then
		groups.tubedevice = 1
		groups.tubedevice_receiver = 1
	end
	local active_groups = {not_in_creative_inventory = 1}
	for k, v in pairs(groups) do active_groups[k] = v end

	local formspec =
		"size[9,9;]"..
		"list[current_name;src;"..(4-input_size)..",1;"..input_size..",1;]"..
		mcl_formspec.get_itemslot_bg(4-input_size,1,input_size,1)..
		"list[current_name;dst;5,1;2,2;]"..
		mcl_formspec.get_itemslot_bg(5,1,2,2)..
		"list[current_player;main;0,5;9,4;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,4)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
		"label[0,0;"..machine_desc:format(tier).."]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"
	if data.upgrade then
		formspec = formspec..
			"list[current_name;upgrade1;1,3;1,1;]"..
			mcl_formspec.get_itemslot_bg(1,3,1,1)..
			"list[current_name;upgrade2;2,3;1,1;]"..
			mcl_formspec.get_itemslot_bg(2,3,1,1)..
			"label[1,4;"..S("Upgrade Slots").."]"..
			"listring[current_player;main]"..
			"listring[current_name;upgrade1]"..
			"listring[current_player;main]"..
			"listring[current_name;upgrade2]"..
			"listring[current_player;main]"
	end

	local run = function(pos, node)
		local meta     = minetest.get_meta(pos)
		local inv      = meta:get_inventory()
		local eu_input = meta:get_int(tier.."_EU_input")

		local machine_desc_tier = machine_desc:format(tier)
		local machine_node      = "mcl_technic:"..ltier.."_"..machine_name
		local machine_demand    = data.demand

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int(tier.."_EU_demand", machine_demand[1])
			meta:set_int(tier.."_EU_input", 0)
			return
		end

		local EU_upgrade, tube_upgrade = 0, 0
		if data.upgrade then
			EU_upgrade, tube_upgrade = mcl_technic.handle_machine_upgrades(meta)
		end
		if data.tube then
			mcl_technic.handle_machine_mcl_pipeworks(pos, tube_upgrade)
		end

		local powered = eu_input >= machine_demand[EU_upgrade+1]
		if powered then
			meta:set_int("src_time", meta:get_int("src_time") + round(data.speed*10))
		end
		while true do
			local result = mcl_technic.get_recipe(typename, inv:get_list("src"))
			if not result then
				mcl_technic.swap_node(pos, machine_node)
				meta:set_string("infotext", S("%s Idle"):format(machine_desc_tier))
				meta:set_int(tier.."_EU_demand", 0)
				meta:set_int("src_time", 0)
				return
			end
			meta:set_int(tier.."_EU_demand", machine_demand[EU_upgrade+1])
			mcl_technic.swap_node(pos, machine_node.."_active")
			meta:set_string("infotext", S("%s Active"):format(machine_desc_tier))
			if meta:get_int("src_time") < round(result.time*10) then
				if not powered then
					mcl_technic.swap_node(pos, machine_node)
					meta:set_string("infotext", S("%s Unpowered"):format(machine_desc_tier))
				end
				return
			end
			local output = result.output
			if type(output) ~= "table" then output = { output } end
			local output_stacks = {}
			for _, o in ipairs(output) do
				table.insert(output_stacks, ItemStack(o))
				if mcl_experience.throw_xp then
					local dir = vector.divide(minetest.facedir_to_dir(minetest.get_node(pos).param2),-1.95)
					mcl_experience.throw_xp(vector.add(pos, dir), 1)
				end
			end
			local room_for_output = true
			inv:set_size("dst_tmp", inv:get_size("dst"))
			inv:set_list("dst_tmp", inv:get_list("dst"))
			for _, o in ipairs(output_stacks) do
				if not inv:room_for_item("dst_tmp", o) then
					room_for_output = false
					break
				end
				inv:add_item("dst_tmp", o)
			end
			if not room_for_output then
				mcl_technic.swap_node(pos, machine_node)
				meta:set_string("infotext", S("%s Idle"):format(machine_desc_tier))
				meta:set_int(tier.."_EU_demand", 0)
				meta:set_int("src_time", round(result.time*10))
				return
			end
			meta:set_int("src_time", meta:get_int("src_time") - round(result.time*10))
			inv:set_list("src", result.new_input)
			inv:set_list("dst", inv:get_list("dst_tmp"))
		end
	end

	local tentry = tube_entry
	if ltier == "lv" then
		tentry = ""
	end
	minetest.register_node("mcl_technic:"..ltier.."_"..machine_name, {
		description = machine_desc:format(tier),
		tiles = {
			"mcl_technic_"..ltier.."_"..machine_name.."_top.png",
			"mcl_technic_"..ltier.."_"..machine_name.."_bottom.png",
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_front.png"
		},
		paramtype2 = "facedir",
		groups = groups,
		tube = data.tube and tube or nil,
		connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = mcl_sounds.node_sound_wood_defaults(),
		_mcl_blast_resistance = 6,
	    _mcl_hardness = 1.5,
		on_construct = function(pos)
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)

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

			meta:set_string("infotext", machine_desc:format(tier))
			meta:set_int("tube_time",  0)
			meta:set_string("formspec", formspec..form_buttons)
			local inv = meta:get_inventory()
			inv:set_size("src", input_size)
			inv:set_size("dst", 4)
			inv:set_size("upgrade1", 1)
			inv:set_size("upgrade2", 1)
		end,
		can_dig = mcl_technic.machine_can_dig,
		allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
		allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
		allow_metadata_inventory_move = mcl_technic.machine_inventory_move,
		mcl_technic_run = run,
		after_place_node = data.tube and mcl_pipeworks.after_place,
		after_dig_node = mcl_technic.machine_after_dig_node,
		on_receive_fields = function(pos, formname, fields, sender)
			local node = minetest.get_node(pos)
			if not mcl_pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local meta = minetest.get_meta(pos)
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
			meta:set_string("formspec", formspec..form_buttons)
		end,
	})

	minetest.register_node("mcl_technic:"..ltier.."_"..machine_name.."_active",{
		description = machine_desc:format(tier),
		tiles = {
			"mcl_technic_"..ltier.."_"..machine_name.."_top.png",
			"mcl_technic_"..ltier.."_"..machine_name.."_bottom.png",
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_side.png"..tentry,
			"mcl_technic_"..ltier.."_"..machine_name.."_front_active.png"
		},
		paramtype2 = "facedir",
		drop = "mcl_technic:"..ltier.."_"..machine_name,
		groups = active_groups,
		connect_sides = data.connect_sides or connect_default,
		legacy_facedir_simple = true,
		sounds = mcl_sounds.node_sound_wood_defaults(),
		_mcl_blast_resistance = 6,
	    _mcl_hardness = 1.5,
		tube = data.tube and tube or nil,
		can_dig = mcl_technic.machine_can_dig,
		allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
		allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
		allow_metadata_inventory_move = mcl_technic.machine_inventory_move,
		mcl_technic_run = run,
		mcl_technic_disabled_machine_name = "mcl_technic:"..ltier.."_"..machine_name,
		on_receive_fields = function(pos, formname, fields, sender)
			local node = minetest.get_node(pos)
			if not mcl_pipeworks.may_configure(pos, sender) then return end
			fs_helpers.on_receive_fields(pos, fields)
			local meta = minetest.get_meta(pos)
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
			meta:set_string("formspec", formspec..form_buttons)
		end,
	})

	mcl_technic.register_machine(tier, "mcl_technic:"..ltier.."_"..machine_name,            mcl_technic.receiver)
	mcl_technic.register_machine(tier, "mcl_technic:"..ltier.."_"..machine_name.."_active", mcl_technic.receiver)

end -- End registration
