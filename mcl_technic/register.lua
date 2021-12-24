-- This file includes the functions and data structures for registering machines and tools for LV, MV, HV types.
-- We use the mcl_technic namespace for these functions and data to avoid eventual conflict.

mcl_technic.receiver = "RE"
mcl_technic.producer = "PR"
mcl_technic.producer_receiver = "PR_RE"
mcl_technic.battery  = "BA"

mcl_technic.machines    = {}
mcl_technic.power_tools = {}
mcl_technic.networks = {}


function mcl_technic.register_tier(tier, description)
	mcl_technic.machines[tier] = {}
end

function mcl_technic.register_machine(tier, nodename, machine_type)
	if not mcl_technic.machines[tier] then
		return
	end
	mcl_technic.machines[tier][nodename] = machine_type
end

function mcl_technic.register_power_tool(craftitem, max_charge)
	mcl_technic.power_tools[craftitem] = max_charge
end


-- Utility functions. Not sure exactly what they do.. water.lua uses the two first.
function mcl_technic.get_RE_item_load(load1, max_load)
	if load1 == 0 then load1 = 65535 end
	local temp = 65536 - load1
	temp = temp / 65535 * max_load
	return math.floor(temp + 0.5)
end

function mcl_technic.set_RE_item_load(load1, max_load)
	if load1 == 0 then return 65535 end
	local temp = load1 / max_load * 65535
	temp = 65536 - temp
	return math.floor(temp)
end

-- Wear down a tool depending on the remaining charge.
function mcl_technic.set_RE_wear(itemstack, item_load, max_load)
	if (minetest.registered_items[itemstack:get_name()].wear_represents or "mechanical_wear") ~= "mcl_technic_RE_charge" then return itemstack end
	local temp
	if item_load == 0 then
		temp = 0
	else
		temp = 65536 - math.floor(item_load / max_load * 65535)
		if temp > 65535 then temp = 65535 end
		if temp < 1 then temp = 1 end
	end
	itemstack:set_wear(temp)
	return itemstack
end
