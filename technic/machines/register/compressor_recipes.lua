
local S = technic.getter

technic.register_recipe_type("compressing", { description = S("Compressing") })

function technic.register_compressor_recipe(data)
	data.time = data.time or 4
	technic.register_recipe("compressing", data)
end

local recipes = {
	{"mcl_core:snowblock",          "mcl_core:ice"},
	{"mcl_core:sand",               "mcl_core:sandstone 2"},
	{"mcl_core:redsand",            "mcl_core:redsandstone 2"},
	{"technic:coal_dust 2",         "technic:graphite"},
	{"technic:carbon_cloth",        "technic:carbon_plate 2"},
    {"mcl_core:coalblock",          "mcl_core:diamond 2"},
    {"technic:sawdust",             "mcl_core:paper"},
    {"mcl_core:coal_lump 9",          "mcl_core:coalblock"},
    {"mcl_core:gold_ingot 9",         "mcl_core:goldblock"},
    {"mcl_core:iron_ingot 9",         "mcl_core:ironblock"},
    {"mcl_copper:copper_ingot 9",     "mcl_copper:block"},
    {"mcl_copper:raw_copper 9",       "mcl_copper:block_raw"},
    {"mcl_core:diamond 9",            "mcl_core:diamondblock"},
    {"mcl_dye:blue 9",                "mcl_core:lapisblock"},
    {"mcl_core:emerald 9",            "mcl_core:emeraldblock"},
}

for _, data in pairs(recipes) do
	technic.register_compressor_recipe({input = {data[1]}, output = data[2]})
end

