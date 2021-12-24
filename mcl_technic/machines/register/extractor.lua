
local S = mcl_technic.getter

function mcl_technic.register_extractor(data)
	data.typename = "extracting"
	data.machine_name = "extractor"
	data.machine_desc = S("%s Extractor")
	mcl_technic.register_base_machine(data)
end
