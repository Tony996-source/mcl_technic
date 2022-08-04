
local S = mcl_technic.getter

mcl_technic.register_recipe_type("compressing", { description = S("Compressing") })

function mcl_technic.register_compressor_recipe(data)
	data.time = data.time or 4
	mcl_technic.register_recipe("compressing", data)
end

local recipes = {
	{"mcl_core:snowblock",          "mcl_core:ice"},
	{"mcl_core:sand",               "mcl_core:sandstone 2"},
	{"mcl_core:redsand",            "mcl_core:redsandstone 2"},
	{"mcl_technic:coal_dust 2",     "mcl_technic:graphite"},
	{"mcl_technic:charcoal_dust 2", "mcl_technic:graphite"},
	{"mcl_technic:carbon_cloth",    "mcl_technic:carbon_plate 2"},
    {"mcl_core:coalblock",          "mcl_core:diamond 2"},
    {"mcl_technic:charcoalblock",   "mcl_core:diamond 2"},
    {"mcl_core:charcoal_lump 9",    "mcl_technic:charcoalblock"},
    {"mcl_technic:sawdust 8",       "mcl_core:paper"},
    {"mcl_core:coal_lump 9",        "mcl_core:coalblock"},
    {"mcl_raw_ores:raw_gold 9",     "mcl_raw_ores:raw_gold_block"},
    {"mcl_raw_ores:raw_iron 9",     "mcl_raw_ores:raw_iron_block"},
    {"mcl_core:gold_ingot 9",       "mcl_core:goldblock"},
    {"mcl_core:iron_ingot 9",       "mcl_core:ironblock"},
    {"mcl_copper:copper_ingot 9",   "mcl_copper:block"},
    {"mcl_copper:raw_copper 9",     "mcl_copper:block_raw"},
    {"mcl_core:diamond 9",          "mcl_core:diamondblock"},
    {"mcl_technic:steel_ingot 9",   "mcl_technic:steel_block"},
    {"mcl_dye:blue 9",              "mcl_core:lapisblock"},
    {"mcl_core:emerald 9",          "mcl_core:emeraldblock"},
    {"mcl_mobitems:rotten_flesh 9", "mcl_mobitems:leather"},
    {"mcl_technic:copper_nugget 9", "mcl_copper:copper_ingot"},
    {"mcl_technic:diamond_dust 2",  "mcl_core:diamond"},
    {"mesecons:redstone 9",         "mesecons_torch:redstoneblock"}
}

for _, data in pairs(recipes) do
	mcl_technic.register_compressor_recipe({input = {data[1]}, output = data[2]})
end

