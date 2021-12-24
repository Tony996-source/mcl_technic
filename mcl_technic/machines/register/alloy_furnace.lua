
local S = mcl_technic.getter

function mcl_technic.register_alloy_furnace(data)
	data.typename = "alloy"
	data.machine_name = "alloy_furnace"
	data.machine_desc = S("%s Alloy Furnace")
	mcl_technic.register_base_machine(data)
end
