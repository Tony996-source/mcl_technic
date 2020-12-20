technic.config = technic.config or Settings(minetest.get_worldpath().."/technic.conf")

local conf_table = technic.config:to_table()

local defaults = {

	enable_flashlight = "true",
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		technic.config:set(k, v)
	end
end
