mcl_technic.config = mcl_technic.config or Settings(minetest.get_worldpath().."/mcl_technic.conf")

local conf_table = mcl_technic.config:to_table()

local defaults = {

	enable_flashlight = "true",
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		mcl_technic.config:set(k, v)
	end
end
