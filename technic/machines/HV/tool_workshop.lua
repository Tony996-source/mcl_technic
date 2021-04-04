-- Tool workshop
-- This machine repairs tools.

minetest.register_alias("tool_workshop", "technic:tool_workshop_hv")

local S = technic.getter

local tube_entry = "^pipeworks_tube_connection_metallic.png"

minetest.register_craft({
	output = 'technic:tool_workshop_hv',
	recipe = {
	{'technic:steel_ingot', 'technic:tool_workshop_mv', 'technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:steel_block', 'technic:hv_cable', 'technic:steel_block'},
	}
})

local workshop_demand = {10000, 5000, 1500}

local workshop_formspec =
	"size[9,9;]"..
	"list[current_name;src;3,1;1,1;]"..
	mcl_formspec.get_itemslot_bg(3,1,1,1)..
	"label[0,0;"..S("%s Tool Workshop"):format("HV").."]"..
	"list[current_name;upgrade1;1,3;1,1;]"..
	mcl_formspec.get_itemslot_bg(1,3,1,1)..
	"list[current_name;upgrade2;2,3;1,1;]"..
	mcl_formspec.get_itemslot_bg(2,3,1,1)..
	"label[1,4;"..S("Upgrade Slots").."]"..
	"list[current_player;main;0,5;9,3;9]"..
	mcl_formspec.get_itemslot_bg(0,5,9,3)..
	"list[current_player;main;0,8;9,1;]"..
	mcl_formspec.get_itemslot_bg(0,8,9,1)..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;upgrade1]"..
	"listring[current_player;main]"..
	"listring[current_name;upgrade2]"..
	"listring[current_player;main]"

local run = function(pos, node)
	local meta         = minetest.get_meta(pos)
	local inv          = meta:get_inventory()
	local eu_input     = meta:get_int("HV_EU_input")
	local machine_name = S("%s Tool Workshop"):format("HV")
	local machine_node = "technic:tool_workshop_hv"

	-- Setup meta data if it does not exist.
	if not eu_input then
		meta:set_int("HV_EU_demand", workshop_demand[1])
		meta:set_int("HV_EU_input", 0)
		return
	end

	local EU_upgrade, tube_upgrade = technic.handle_machine_upgrades(meta)

	local repairable = false
	local srcstack = inv:get_stack("src", 1)
	if not srcstack:is_empty() then
		local itemdef = minetest.registered_items[srcstack:get_name()]
		if itemdef and
				(not itemdef.wear_represents or
				itemdef.wear_represents == "mechanical_wear") and
				srcstack:get_wear() ~= 0 then
			repairable = true
		end
	end
	technic.handle_machine_pipeworks(pos, tube_upgrade, function (pos, x_velocity, z_velocity)
		if not repairable then
			technic.send_items(pos, x_velocity, z_velocity, "src")
		end
	end)
	if not repairable then
		meta:set_string("infotext", S("%s Idle"):format(machine_name))
		meta:set_int("HV_EU_demand", 0)
		technic.swap_node(pos, "technic:tool_workshop_hv")
		return
	end
	
	if eu_input < workshop_demand[EU_upgrade+1] then
		meta:set_string("infotext", S("%s Idle"):format(machine_name))
		technic.swap_node(pos, "technic:tool_workshop_hv")
	elseif eu_input >= workshop_demand[EU_upgrade+1] then
	    technic.swap_node(pos, "technic:tool_workshop_hv_active")
		meta:set_string("infotext", S("%s Active"):format(machine_name))
		srcstack:add_wear(-8000)
		inv:set_stack("src", 1, srcstack)
	end
	return
	meta:set_int("HV_EU_demand", workshop_demand[EU_upgrade+1])
	
end

minetest.register_node("technic:tool_workshop_hv", {
	description = S("%s Tool Workshop"):format("HV"),
	paramtype2 = "facedir",
	tiles = {
		"technic_hv_workshop_top.png",
		"technic_hv_workshop_bottom.png",
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_front.png"
	},
	groups = {pickaxey=1,axey=1, handy=1, swordy=1,
		technic_machine=1, technic_hv=1, tubedevice=1, tubedevice_receiver=1},
	connect_sides = {"bottom", "back", "left", "right"},
	sounds = mcl_sounds.node_sound_wood_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 1.5,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("%s Tool Workshop"):format("HV"))
		meta:set_string("formspec", workshop_formspec)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("upgrade1", 1)
		inv:set_size("upgrade2", 1)
	end,	
	can_dig = technic.machine_can_dig,
	allow_metadata_inventory_put = technic.machine_inventory_put,
	allow_metadata_inventory_take = technic.machine_inventory_take,
	tube = {
		can_insert = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():room_for_item("src", stack)
		end,
		insert_object = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():add_item("src", stack)
		end,
		connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
	},
	technic_run = run,
	after_place_node = pipeworks.after_place,
	after_dig_node = technic.machine_after_dig_node
})

minetest.register_node("technic:tool_workshop_hv_active", {
	description = S("%s Tool Workshop"):format("HV"),
	paramtype2 = "facedir",
	tiles = {
		"technic_hv_workshop_top.png",
		"technic_hv_workshop_bottom.png",
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_side.png"..tube_entry,
		"technic_hv_workshop_front_active.png"
	},
	groups = {pickaxey=1,axey=1, handy=1, swordy=1, not_in_creative_inventory = 1,
		technic_machine=1, technic_hv=1, tubedevice=1, tubedevice_receiver=1},
	drop = "technic:tool_workshop_hv",
	connect_sides = {"bottom", "back", "left", "right"},
	sounds = mcl_sounds.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("%s Tool Workshop"):format("HV"))
		meta:set_string("formspec", workshop_formspec)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("upgrade1", 1)
		inv:set_size("upgrade2", 1)
	end,	
	can_dig = technic.machine_can_dig,
	allow_metadata_inventory_put = technic.machine_inventory_put,
	allow_metadata_inventory_take = technic.machine_inventory_take,
	tube = {
		can_insert = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():room_for_item("src", stack)
		end,
		insert_object = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():add_item("src", stack)
		end,
		connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
	},
	technic_run = run,
	after_place_node = pipeworks.after_place,
	after_dig_node = technic.machine_after_dig_node
})

technic.register_machine("HV", "technic:tool_workshop_hv", technic.receiver)

