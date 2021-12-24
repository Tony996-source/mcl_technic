
local S = mcl_technic.getter

function mcl_technic.register_electric_furnace(data)
	data.typename = "cooking"
	data.machine_name = "electric_furnace"
	data.machine_desc = S("%s Furnace")
	mcl_technic.register_base_machine(data)
end
