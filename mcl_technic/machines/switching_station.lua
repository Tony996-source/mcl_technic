-- See also mcl_technic/doc/api.md

mcl_technic.networks = {}
mcl_technic.cables = {}
mcl_technic.redundant_warn = {}

local mesecons_path = minetest.get_modpath("mesecons")
local digilines_path = minetest.get_modpath("digilines")

local S = mcl_technic.getter

local cable_entry = "^mcl_technic_cable_connection_overlay.png"

minetest.register_craft({
	output = "mcl_technic:switching_station",
	recipe = {
	{"",                     "mcl_core:iron_ingot", ""},
	{"mcl_core:iron_ingot", "mcl_core:gold_ingot", "mcl_core:iron_ingot"},
	{"mcl_technic:lv_cable",     "mcl_technic:lv_cable",       "mcl_technic:lv_cable"}
	}
})

local mesecon_def
if mesecons_path then
	mesecon_def = {effector = {
		rules = mesecon.rules.default,
	}}
end

minetest.register_node("mcl_technic:switching_station",{
	description = S("Switching Station"),
	tiles  = {
		"mcl_technic_switching_station_side.png",
		"mcl_technic_switching_station_side.png"..cable_entry,
		"mcl_technic_switching_station_side.png",
		"mcl_technic_switching_station_side.png",
		"mcl_technic_switching_station_side.png",
		"mcl_technic_switching_station_side.png"},
	groups = {pickaxey=1,axey=1, handy=1, swordy=1, mcl_technic_all_tiers=1},
	connect_sides = {"bottom"},
	sounds = mcl_sounds.node_sound_wood_defaults(),
	_mcl_blast_resistance = 6,
	    _mcl_hardness = 1.5,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Switching Station"))
		meta:set_string("active", 1)
		meta:set_string("channel", "switching_station"..minetest.pos_to_string(pos))
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
		local poshash = minetest.hash_node_position(pos)
		mcl_technic.redundant_warn.poshash = nil
	end,
	after_dig_node = function(pos)
		minetest.forceload_free_block(pos)
		pos.y = pos.y - 1
		minetest.forceload_free_block(pos)
		local poshash = minetest.hash_node_position(pos)
		mcl_technic.redundant_warn.poshash = nil
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if not fields.channel then
			return
		end
		local plname = sender:get_player_name()
		if minetest.is_protected(pos, plname) then
			minetest.record_protection_violation(pos, plname)
			return
		end
		local meta = minetest.get_meta(pos)
		meta:set_string("channel", fields.channel)
	end,
	mesecons = mesecon_def,
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
				digilines.receptor_send(pos, digilines.rules.default, channel, {
					supply = meta:get_int("supply"),
					demand = meta:get_int("demand")
				})
			end
		},
	},
})

--------------------------------------------------
-- Functions to traverse the electrical network
--------------------------------------------------
local function flatten(map)
	local list = {}
	for key, value in pairs(map) do
		list[#list + 1] = value
	end
	return list
end

-- Add a wire node to the LV/MV/HV network
local function add_network_node(nodes, pos, network_id)
	local node_id = minetest.hash_node_position(pos)
	mcl_technic.cables[node_id] = network_id
	if nodes[node_id] then
		return false
	end
	nodes[node_id] = pos
	return true
end

local function add_cable_node(nodes, pos, network_id, queue)
	if add_network_node(nodes, pos, network_id) then
		queue[#queue + 1] = pos
	end
end

-- Generic function to add found connected nodes to the right classification array
local check_node_subp = function(PR_nodes, RE_nodes, BA_nodes, SP_nodes, all_nodes, pos, machines, tier, sw_pos, from_below, network_id, queue)
	mcl_technic.get_or_load_node(pos)
	local meta = minetest.get_meta(pos)
	local name = minetest.get_node(pos).name

	if mcl_technic.is_tier_cable(name, tier) then
		add_cable_node(all_nodes, pos,network_id, queue)
	elseif machines[name] then
		--dprint(name.." is a "..machines[name])
		meta:set_string(tier.."_network",minetest.pos_to_string(sw_pos))
		if     machines[name] == mcl_technic.producer then
			add_network_node(PR_nodes, pos, network_id)
		elseif machines[name] == mcl_technic.receiver then
			add_network_node(RE_nodes, pos, network_id)
		elseif machines[name] == mcl_technic.producer_receiver then
			add_network_node(PR_nodes, pos, network_id)
			add_network_node(RE_nodes, pos, network_id)
		elseif machines[name] == "SPECIAL" and
				(pos.x ~= sw_pos.x or pos.y ~= sw_pos.y or pos.z ~= sw_pos.z) and
				from_below then
			-- Another switching station -> disable it
			add_network_node(SP_nodes, pos, network_id)
			meta:set_int("active", 0)
		elseif machines[name] == mcl_technic.battery then
			add_network_node(BA_nodes, pos, network_id)
		end

		meta:set_int(tier.."_EU_timeout", 2) -- Touch node
	end
end

-- Traverse a network given a list of machines and a cable type name
local traverse_network = function(PR_nodes, RE_nodes, BA_nodes, SP_nodes, all_nodes, pos, machines, tier, sw_pos, network_id, queue)
	local positions = {
		{x=pos.x+1, y=pos.y,   z=pos.z},
		{x=pos.x-1, y=pos.y,   z=pos.z},
		{x=pos.x,   y=pos.y+1, z=pos.z},
		{x=pos.x,   y=pos.y-1, z=pos.z},
		{x=pos.x,   y=pos.y,   z=pos.z+1},
		{x=pos.x,   y=pos.y,   z=pos.z-1}}
	for i, cur_pos in pairs(positions) do
		check_node_subp(PR_nodes, RE_nodes, BA_nodes, SP_nodes, all_nodes, cur_pos, machines, tier, sw_pos, i == 3, network_id, queue)
	end
end

local touch_nodes = function(list, tier)
	for _, pos in ipairs(list) do
		local meta = minetest.get_meta(pos)
		meta:set_int(tier.."_EU_timeout", 2) -- Touch node
	end
end

local get_network = function(sw_pos, pos1, tier)
	local network_id = minetest.hash_node_position(pos1)
	local cached = mcl_technic.networks[network_id]
	if cached and cached.tier == tier then
		touch_nodes(cached.PR_nodes, tier)
		touch_nodes(cached.BA_nodes, tier)
		touch_nodes(cached.RE_nodes, tier)
		for _, pos in ipairs(cached.SP_nodes) do
			local meta = minetest.get_meta(pos)
			meta:set_int("active", 0)
			meta:set_string("active_pos", minetest.serialize(sw_pos))
		end
		return cached.PR_nodes, cached.BA_nodes, cached.RE_nodes
	end
	local PR_nodes = {}
	local BA_nodes = {}
	local RE_nodes = {}
	local SP_nodes = {}
	local all_nodes = {}
	local queue = {}
	add_cable_node(all_nodes, pos1, network_id, queue)
	while next(queue) do
		local to_visit = {}
		for _, pos in ipairs(queue) do
			traverse_network(PR_nodes, RE_nodes, BA_nodes, SP_nodes, all_nodes,
					pos, mcl_technic.machines[tier], tier, sw_pos, network_id, to_visit)
		end
		queue = to_visit
	end
	PR_nodes = flatten(PR_nodes)
	BA_nodes = flatten(BA_nodes)
	RE_nodes = flatten(RE_nodes)
	SP_nodes = flatten(SP_nodes)
	all_nodes = flatten(all_nodes)
	mcl_technic.networks[network_id] = {tier = tier, all_nodes = all_nodes, SP_nodes = SP_nodes,
			PR_nodes = PR_nodes, RE_nodes = RE_nodes, BA_nodes = BA_nodes}
	return PR_nodes, BA_nodes, RE_nodes
end

-----------------------------------------------
-- The action code for the switching station --
-----------------------------------------------

mcl_technic.powerctrl_state = true

minetest.register_chatcommand("powerctrl", {
	params = "state",
	description = "Enables or disables mcl_technic's switching station ABM",
	privs = { basic_privs = true },
	func = function(name, state)
		if state == "on" then
			mcl_technic.powerctrl_state = true
		else
			mcl_technic.powerctrl_state = false
		end
	end
})

minetest.register_abm({
	nodenames = {"mcl_technic:switching_station"},
	label = "Switching Station", -- allows the mtt profiler to profile this abm individually
	interval   = 1,
	chance     = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if not mcl_technic.powerctrl_state then return end
		local meta             = minetest.get_meta(pos)
		local meta1            = nil
		local pos1             = {}
		local PR_EU            = 0 -- EUs from PR nodes
		local BA_PR_EU         = 0 -- EUs from BA nodes (discharching)
		local BA_RE_EU         = 0 -- EUs to BA nodes (charging)
		local RE_EU            = 0 -- EUs to RE nodes

		local tier      = ""
		local PR_nodes
		local BA_nodes
		local RE_nodes
		local machine_name = S("Switching Station")

		-- Which kind of network are we on:
		pos1 = {x=pos.x, y=pos.y-1, z=pos.z}

		--Disable if necessary
		if meta:get_int("active") ~= 1 then
			minetest.forceload_free_block(pos)
			minetest.forceload_free_block(pos1)
			meta:set_string("infotext",S("%s Already Present"):format(machine_name))

			local poshash = minetest.hash_node_position(pos)

			if not mcl_technic.redundant_warn[poshash] then
				mcl_technic.redundant_warn[poshash] = true
				print("[mcl_technic] Warning: redundant switching station found near "..minetest.pos_to_string(pos))
			end
			return
		end

		local name = minetest.get_node(pos1).name
		local tier = mcl_technic.get_cable_tier(name)
		if tier then
			-- Forceload switching station
			minetest.forceload_block(pos)
			minetest.forceload_block(pos1)
			PR_nodes, BA_nodes, RE_nodes = get_network(pos, pos1, tier)
		else
			--dprint("Not connected to a network")
			meta:set_string("infotext", S("%s Has No Network"):format(machine_name))
			minetest.forceload_free_block(pos)
			minetest.forceload_free_block(pos1)
			return
		end

		-- Run all the nodes
		local function run_nodes(list, run_stage)
			for _, pos2 in ipairs(list) do
				mcl_technic.get_or_load_node(pos2)
				local node2 = minetest.get_node(pos2)
				local nodedef
				if node2 and node2.name then
					nodedef = minetest.registered_nodes[node2.name]
				end
				if nodedef and nodedef.mcl_technic_run then
					nodedef.mcl_technic_run(pos2, node2, run_stage)
				end
			end
		end

		run_nodes(PR_nodes, mcl_technic.producer)
		run_nodes(RE_nodes, mcl_technic.receiver)
		run_nodes(BA_nodes, mcl_technic.battery)

		-- Strings for the meta data
		local eu_demand_str    = tier.."_EU_demand"
		local eu_input_str     = tier.."_EU_input"
		local eu_supply_str    = tier.."_EU_supply"

		-- Distribute charge equally across multiple batteries.
		local charge_total = 0
		local battery_count = 0

		for n, pos1 in pairs(BA_nodes) do
			meta1 = minetest.get_meta(pos1)
			local charge = meta1:get_int("internal_EU_charge")

			if (meta1:get_int(eu_demand_str) ~= 0) then
				charge_total = charge_total + charge
				battery_count = battery_count + 1
			end
		end

		local charge_distributed = math.floor(charge_total / battery_count)

		for n, pos1 in pairs(BA_nodes) do
			meta1 = minetest.get_meta(pos1)

			if (meta1:get_int(eu_demand_str) ~= 0) then
				meta1:set_int("internal_EU_charge", charge_distributed)
			end
		end

		-- Get all the power from the PR nodes
		local PR_eu_supply = 0 -- Total power
		for _, pos1 in pairs(PR_nodes) do
			meta1 = minetest.get_meta(pos1)
			PR_eu_supply = PR_eu_supply + meta1:get_int(eu_supply_str)
		end
		--dprint("Total PR supply:"..PR_eu_supply)

		-- Get all the demand from the RE nodes
		local RE_eu_demand = 0
		for _, pos1 in pairs(RE_nodes) do
			meta1 = minetest.get_meta(pos1)
			RE_eu_demand = RE_eu_demand + meta1:get_int(eu_demand_str)
		end
		--dprint("Total RE demand:"..RE_eu_demand)

		-- Get all the power from the BA nodes
		local BA_eu_supply = 0
		for _, pos1 in pairs(BA_nodes) do
			meta1 = minetest.get_meta(pos1)
			BA_eu_supply = BA_eu_supply + meta1:get_int(eu_supply_str)
		end
		--dprint("Total BA supply:"..BA_eu_supply)

		-- Get all the demand from the BA nodes
		local BA_eu_demand = 0
		for _, pos1 in pairs(BA_nodes) do
			meta1 = minetest.get_meta(pos1)
			BA_eu_demand = BA_eu_demand + meta1:get_int(eu_demand_str)
		end
		--dprint("Total BA demand:"..BA_eu_demand)

		meta:set_string("infotext", S("@1. Supply: @2 Demand: @3",
				machine_name, mcl_technic.EU_string(PR_eu_supply),
				mcl_technic.EU_string(RE_eu_demand)))

		-- If mesecon signal and power supply or demand changed then
		-- send them via digilines.
		if mesecons_path and digilines_path and mesecon.is_powered(pos) then
			if PR_eu_supply ~= meta:get_int("supply") or
					RE_eu_demand ~= meta:get_int("demand") then
				local channel = meta:get_string("channel")
				digilines.receptor_send(pos, digilines.rules.default, channel, {
					supply = PR_eu_supply,
					demand = RE_eu_demand
				})
			end
		end

		-- Data that will be used by the power monitor
		meta:set_int("supply",PR_eu_supply)
		meta:set_int("demand",RE_eu_demand)

		-- If the PR supply is enough for the RE demand supply them all
		if PR_eu_supply >= RE_eu_demand then
		--dprint("PR_eu_supply"..PR_eu_supply.." >= RE_eu_demand"..RE_eu_demand)
			for _, pos1 in pairs(RE_nodes) do
				meta1 = minetest.get_meta(pos1)
				local eu_demand = meta1:get_int(eu_demand_str)
				meta1:set_int(eu_input_str, eu_demand)
			end
			-- We have a surplus, so distribute the rest equally to the BA nodes
			-- Let's calculate the factor of the demand
			PR_eu_supply = PR_eu_supply - RE_eu_demand
			local charge_factor = 0 -- Assume all batteries fully charged
			if BA_eu_demand > 0 then
				charge_factor = PR_eu_supply / BA_eu_demand
			end
			for n, pos1 in pairs(BA_nodes) do
				meta1 = minetest.get_meta(pos1)
				local eu_demand = meta1:get_int(eu_demand_str)
				meta1:set_int(eu_input_str, math.floor(eu_demand * charge_factor))
				--dprint("Charging battery:"..math.floor(eu_demand*charge_factor))
			end
			return
		end

		-- If the PR supply is not enough for the RE demand we will discharge the batteries too
		if PR_eu_supply + BA_eu_supply >= RE_eu_demand then
			--dprint("PR_eu_supply "..PR_eu_supply.."+BA_eu_supply "..BA_eu_supply.." >= RE_eu_demand"..RE_eu_demand)
			for _, pos1 in pairs(RE_nodes) do
				meta1  = minetest.get_meta(pos1)
				local eu_demand = meta1:get_int(eu_demand_str)
				meta1:set_int(eu_input_str, eu_demand)
			end
			-- We have a deficit, so distribute to the BA nodes
			-- Let's calculate the factor of the supply
			local charge_factor = 0 -- Assume all batteries depleted
			if BA_eu_supply > 0 then
				charge_factor = (PR_eu_supply - RE_eu_demand) / BA_eu_supply
			end
			for n,pos1 in pairs(BA_nodes) do
				meta1 = minetest.get_meta(pos1)
				local eu_supply = meta1:get_int(eu_supply_str)
				meta1:set_int(eu_input_str, math.floor(eu_supply * charge_factor))
				--dprint("Discharging battery:"..math.floor(eu_supply*charge_factor))
			end
			return
		end

		-- If the PR+BA supply is not enough for the RE demand: Power only the batteries
		local charge_factor = 0 -- Assume all batteries fully charged
		if BA_eu_demand > 0 then
			charge_factor = PR_eu_supply / BA_eu_demand
		end
		for n, pos1 in pairs(BA_nodes) do
			meta1 = minetest.get_meta(pos1)
			local eu_demand = meta1:get_int(eu_demand_str)
			meta1:set_int(eu_input_str, math.floor(eu_demand * charge_factor))
		end
		for n, pos1 in pairs(RE_nodes) do
			meta1 = minetest.get_meta(pos1)
			meta1:set_int(eu_input_str, 0)
		end

	end,
})

-- Timeout ABM
-- Timeout for a node in case it was disconnected from the network
-- A node must be touched by the station continuously in order to function
local function switching_station_timeout_count(pos, tier)
	local meta = minetest.get_meta(pos)
	local timeout = meta:get_int(tier.."_EU_timeout")
	if timeout <= 0 then
		meta:set_int(tier.."_EU_input", 0) -- Not needed anymore <-- actually, it is for supply converter
		return true
	else
		meta:set_int(tier.."_EU_timeout", timeout - 1)
		return false
	end
end
minetest.register_abm({
	label = "Machines: timeout check",
	nodenames = {"group:mcl_technic_machine"},
	interval   = 1,
	chance     = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		for tier, machines in pairs(mcl_technic.machines) do
			if machines[node.name] and switching_station_timeout_count(pos, tier) then
				local nodedef = minetest.registered_nodes[node.name]
				if nodedef and nodedef.mcl_technic_disabled_machine_name then
					node.name = nodedef.mcl_technic_disabled_machine_name
					minetest.swap_node(pos, node)
				elseif nodedef and nodedef.mcl_technic_on_disable then
					nodedef.mcl_technic_on_disable(pos, node)
				end
				if nodedef then
					local meta = minetest.get_meta(pos)
					meta:set_string("infotext", S("%s Has No Network"):format(nodedef.description))
				end
			end
		end
	end,
})

--Re-enable disabled switching station if necessary, similar to the timeout above
minetest.register_abm({
	label = "Machines: re-enable check",
	nodenames = {"mcl_technic:switching_station"},
	interval   = 1,
	chance     = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local pos1 = {x=pos.x,y=pos.y-1,z=pos.z}
		local tier = mcl_technic.get_cable_tier(minetest.get_node(pos1).name)
		if not tier then return end
		if switching_station_timeout_count(pos, tier) then
			local meta = minetest.get_meta(pos)
			meta:set_int("active",1)
		end
	end,
})

for tier, machines in pairs(mcl_technic.machines) do
	-- SPECIAL will not be traversed
	mcl_technic.register_machine(tier, "mcl_technic:switching_station", "SPECIAL")
end

