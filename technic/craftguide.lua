
-- Grinding Guide

mcl_craftguide.register_craft_type("grinding", {
	description = "Grinding",
	icon = "technic_hv_grinder_front_active.png",
})

local grind_recipe = {
	-- Dusts
	{"mcl_core:coal_lump",         "technic:coal_dust"},
	{"mcl_core:stone_with_iron",   "technic:iron_dust"},
	{"mcl_core:stone_with_gold",   "technic:gold_dust"},
	{"mcl_core:gold_ingot",        "technic:gold_dust"},
	{"mcl_core:iron_ingot",        "technic:iron_dust"},
	{"mcl_raw_ores:raw_gold",      "technic:gold_dust"},
	{"mcl_raw_ores:raw_iron",      "technic:iron_dust"},
	{"mcl_copper:copper_ingot",    "technic:copper_dust"},
	{"mcl_copper:raw_copper",      "technic:copper_dust"},
	
-- Trees
    {"mcl_core:tree",              "technic:sawdust"},
    {"mcl_core:jungletree",        "technic:sawdust"},
    {"mcl_core:birchtree",         "technic:sawdust"},
    {"mcl_core:sprucetree",        "technic:sawdust"},
    {"mcl_core:acaciatree",        "technic:sawdust"},
    {"mcl_core:darktree",          "technic:sawdust"},
    {"mcl_core:wood",              "technic:sawdust"},
    {"mcl_core:junglewood",        "technic:sawdust"},
    {"mcl_core:sprucewood",        "technic:sawdust"},
    {"mcl_core:birchwood",         "technic:sawdust"},
    {"mcl_core:darkwood",          "technic:sawdust"},
    {"mcl_core:acaciawood",        "technic:sawdust"},
    
	-- Other
	{"mcl_mobitems:bone",          "mcl_dye:white"},
	{"mcl_core:cobble",            "mcl_core:gravel"},
	{"mcl_core:gravel",            "mcl_core:sand"},
	{"mcl_core:sandstone",         "mcl_core:sand"},
	{"mcl_core:redsandstone",      "mcl_core:redsand"},
    {"mcl_core:stone",             "technic:stone_dust"},
    {"technic:steel_ingot",        "technic:steel_dust"},
    {"technic:copper_ingot",       "technic:copper_dust"},
    {"technic:mineral_copper",     "technic:copper_dust"},
    {"mcl_core:iron_nugget",       "technic:lowgrade_iron_dust"},
    {"mcl_core:gold_nugget",       "technic:lowgrade_gold_dust"},
    {"technic:copper_nugget",      "technic:lowgrade_copper_dust"},
}



for _, grind_recipe in pairs(grind_recipe) do


mcl_craftguide.register_craft({
	type   = "grinding",
	width  = 2,
	output = grind_recipe[2],
	items  = {grind_recipe[1]},
})
end

-- Compressing Guide

mcl_craftguide.register_craft_type("compressing", {
	description = "Compressing",
	icon = "technic_hv_compressor_front_active.png",
})

local compress_recipe = {
	{"mcl_core:snowblock",          "mcl_core:ice"},
	{"mcl_core:sand",               "mcl_core:sandstone"},
	{"mcl_core:redsand",            "mcl_core:redsandstone"},
	{"technic:coal_dust",           "technic:graphite"},
	{"technic:carbon_cloth",        "technic:carbon_plate"},
    {"mcl_core:coalblock",          "mcl_core:diamond"},
    {"technic:sawdust",             "mcl_core:paper"},
}

for _, compress_recipe in pairs(compress_recipe) do


mcl_craftguide.register_craft({
	type   = "compressing",
	width  = 2,
	output = compress_recipe[2],
	items  = {compress_recipe[1]},
})
end


-- Extracting Guide

mcl_craftguide.register_craft_type("extracting", {
	description = "Extracting",
	icon = "technic_hv_extractor_front_active.png",
})

local extract_recipe = {
	{"technic:coal_dust",           "mcl_dye:black"},
	{"mcl_core:cactus",             "mcl_dye:green"},
	{"mcl_flowers:blue_orchid",     "mcl_dye:blue"},
	{"mcl_flowers:oxeye_daisy",     "mcl_dye:white"},
	{"mcl_flowers:dandelion",       "mcl_dye:yellow"},
	{"mcl_flowers:tulip",           "mcl_dye:orange"},
	{"mcl_flowers:poppy",           "mcl_dye:red"},
	{"mcl_flowers:allium",          "mcl_dye:purple"},
	{"mcl_flowers:tulip_pink",      "mcl_dye:pink"},
	{"mcl_flowers:tulip_red",       "mcl_dye:red"},
	{"mcl_flowers:tulip_white",     "mcl_dye:white"},
	{"mcl_flowers:tulip_orange",    "mcl_dye:orange"},
	{"mcl_end:chorus_fruit_popped", "mcl_dye:purple"},
	{"technic:oil",                 "pipeworks:oil_extract"},
	{"technic:sawdust",             "technic:oil"},
	{"technic:stone_dust",          "technic:lowgrade_iron_dust"},
	{"mcl_core:sand",               "technic:lowgrade_gold_dust"},
	{"mcl_core:redsand",            "technic:lowgrade_copper_dust"},
}

for _, extract_recipe in pairs(extract_recipe) do


mcl_craftguide.register_craft({
	type   = "extracting",
	width  = 2,
	output = extract_recipe[2],
	items  = {extract_recipe[1]},
})
end


-- cutting Guide

mcl_craftguide.register_craft_type("cutting", {
	description = "Cutting",
	icon = "technic_hv_sawmill_front_active.png",
})

local cut_recipe = {
	    {"mcl_core:tree",                 "mcl_core:wood"},
		{"mcl_core:jungletree",           "mcl_core:junglewood"},
        {"mcl_core:birchtree",            "mcl_core:birchwood"},
        {"mcl_core:sprucetree",           "mcl_core:sprucewood"},
        {"mcl_core:acaciatree",           "mcl_core:acaciawood"},
        {"mcl_core:darktree",             "mcl_core:darkwood"},
        {"mcl_core:wood",                 "mcl_core:stick"},
		{"mcl_core:junglewood",           "mcl_core:stick"},
        {"mcl_core:birchwood",            "mcl_core:stick"},
        {"mcl_core:sprucewood",           "mcl_core:stick"},
        {"mcl_core:acaciawood",           "mcl_core:stick"},
        {"mcl_core:darkwood",             "mcl_core:stick"},
}

for _, cut_recipe in pairs(cut_recipe) do


mcl_craftguide.register_craft({
	type   = "cutting",
	width  = 2,
	output = cut_recipe[2],
	items  = {cut_recipe[1]},
})
end

-- Alloying Guide

mcl_craftguide.register_craft_type("alloying", {
	description = "Alloying",
	icon = "technic_coal_alloy_furnace_front_active.png",
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "technic:silicon_wafer",
	items  = {"mcl_core:sand", "technic:coal_dust"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "technic:doped_silicon_wafer",
	items  = {"technic:silicon_wafer", "technic:gold_dust"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "mcl_buckets:bucket_lava",
	items  = {"mcl_core:obsidian", "mcl_buckets:bucket_empty"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "mcl_buckets:bucket_water",
	items  = {"mcl_core:ice", "mcl_buckets:bucket_empty"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "mcl_buckets:bucket_river_water",
	items  = {"mcl_core:snowblock", "mcl_buckets:bucket_empty"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "mcl_buckets:bucket_water",
	items  = {"mcl_core:snow", "mcl_buckets:bucket_empty"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "technic:steel_ingot",
	items  = {"mcl_core:iron_ingot", "technic:coal_dust"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "technic:steel_ingot",
	items  = {"technic:iron_dust", "technic:coal_dust"},
})

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = "mcl_mobitems:leather",
	items  = {"pipeworks:oil_extract", "technic:rubber"},
})

-- Freezing Guide

mcl_craftguide.register_craft_type("freezing", {
	description = "Freezing",
	icon = "technic_hv_freezer_front_active.png",
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:obsidian",
	items  = {"mcl_buckets:bucket_lava"},
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:ice",
	items  = {"mcl_buckets:bucket_water"},
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:snowblock",
	items  = {"mcl_buckets:bucket_river_water"},
})
