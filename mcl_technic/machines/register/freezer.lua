
local S = mcl_technic.getter

function mcl_technic.register_freezer(data)
	data.typename = "freezing"
	data.machine_name = "freezer"
	data.machine_desc = S("%s Freezer")
	mcl_technic.register_base_machine(data)
end
