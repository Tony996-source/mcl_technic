
local S = mcl_technic.getter

function mcl_technic.register_recycler(data)
	data.typename = "recycling"
	data.machine_name = "recycler"
	data.machine_desc = S("%s Recycler")
	mcl_technic.register_base_machine(data)
end
