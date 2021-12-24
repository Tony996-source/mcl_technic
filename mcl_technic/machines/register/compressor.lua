
local S = mcl_technic.getter

function mcl_technic.register_compressor(data)
	data.typename = "compressing"
	data.machine_name = "compressor"
	data.machine_desc = S("%s Compressor")
	mcl_technic.register_base_machine(data)
end
