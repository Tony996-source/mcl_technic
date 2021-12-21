
local S = technic.getter

function technic.register_recycler(data)
	data.typename = "recycling"
	data.machine_name = "recycler"
	data.machine_desc = S("%s Recycler")
	technic.register_base_machine(data)
end
