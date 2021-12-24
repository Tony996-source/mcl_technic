
local S = mcl_technic.getter

function mcl_technic.register_sawmill(data)
	data.typename = "cutting"
	data.machine_name = "sawmill"
	data.machine_desc = S("%s Sawmill")
	mcl_technic.register_base_machine(data)
end
