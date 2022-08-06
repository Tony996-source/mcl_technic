
local S = mcl_technic.getter

mcl_technic.register_recipe_type("cutting", { description = S("Cutting") })

function mcl_technic.register_sawmill_recipe(data)
	data.time = data.time or 4
	mcl_technic.register_recipe("cutting", data)
end

-- register recipes
local recipes = {
	{"mcl_core:tree",                   "mcl_core:wood 6"},
	{"mcl_core:jungletree",             "mcl_core:junglewood 6"},
    {"mcl_core:birchtree",              "mcl_core:birchwood 6"},
    {"mcl_core:sprucetree",             "mcl_core:sprucewood 6"},
    {"mcl_core:acaciatree",             "mcl_core:acaciawood 6"},
    {"mcl_core:darktree",               "mcl_core:darkwood 6"},
    {"mcl_mangrove:mangrove_tree",      "mcl_mangrove:mangrove_wood 6"},
    {"mcl_core:wood",                   "mcl_core:stick 6"},
	{"mcl_core:junglewood",             "mcl_core:stick 6"},
    {"mcl_core:birchwood",              "mcl_core:stick 6"},
    {"mcl_core:sprucewood",             "mcl_core:stick 6"},
    {"mcl_core:acaciawood",             "mcl_core:stick 6"},
    {"mcl_core:darkwood",               "mcl_core:stick 6"},
    {"mcl_mangrove:mangrove_wood",      "mcl_core:stick 6"},
    {"mcl_core:stripped_acacia",        "mcl_core:acaciawood 6"},
    {"mcl_core:stripped_birch",         "mcl_core:birchwood 6"},
    {"mcl_core:stripped_dark_oak",      "mcl_core:darkwood 6"},
    {"mcl_core:stripped_jungle",        "mcl_core:junglewood 6"},
    {"mcl_core:stripped_oak",           "mcl_core:wood 6"},
    {"mcl_core:stripped_spruce",        "mcl_core:sprucewood 6"},
    {"mcl_core:stripped_acacia_bark",   "mcl_core:acaciawood 6"},
    {"mcl_core:stripped_birch_bark",    "mcl_core:birchwood 6"},
    {"mcl_core:stripped_dark_oak_bark", "mcl_core:darkwood 6"},
    {"mcl_core:stripped_jungle_bark",   "mcl_core:junglewood 6"},
    {"mcl_core:stripped_oak_bark",      "mcl_core:wood 6"},
    {"mcl_core:stripped_spruce_bark",   "mcl_core:sprucewood 6"},
    {"mcl_core:acacia_bark",            "mcl_core:acaciawood 6"},
    {"mcl_core:birch_bark",             "mcl_core:birchwood 6"},
    {"mcl_core:dark_oak_bark",          "mcl_core:darkwood 6"},
    {"mcl_core:jungle_bark",            "mcl_core:junglewood 6"},
    {"mcl_core:oak_bark",               "mcl_core:wood 6"},
    {"mcl_core:spruce_bark",            "mcl_core:sprucewood 6"},
}


    
	for _, data in ipairs(recipes) do
		mcl_technic.register_sawmill_recipe({input = {data[1]}, output = data[2]})
	end
