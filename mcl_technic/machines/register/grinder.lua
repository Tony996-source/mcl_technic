
local S = mcl_technic.getter

function mcl_technic.register_grinder(data)
	data.typename = "grinding"
	data.machine_name = "grinder"
	data.machine_desc = S("%s Grinder")
	mcl_technic.register_base_machine(data)
end
