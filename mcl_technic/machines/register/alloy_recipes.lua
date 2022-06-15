
local S = mcl_technic.getter

mcl_technic.register_recipe_type("alloy", {
	description = S("Alloying"),
	input_size = 2,
})

function mcl_technic.register_alloy_recipe(data)
	data.time = data.time or 6
	mcl_technic.register_recipe("alloy", data)
end

local recipes = {
{"mcl_core:sand",             "mcl_technic:coal_dust",        "mcl_technic:silicon_wafer 2"},
{"mcl_core:sand",             "mcl_technic:charcoal_dust",    "mcl_technic:silicon_wafer 2"},
{"mcl_core:redsand",          "mcl_technic:coal_dust",        "mcl_technic:silicon_wafer 2"},
{"mcl_core:redsand",          "mcl_technic:charcoal_dust",    "mcl_technic:silicon_wafer 2"},
{"mcl_technic:silicon_wafer", "mcl_technic:gold_dust",        "mcl_technic:doped_silicon_wafer 2"},
{"mcl_core:obsidian",         "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_lava"},
{"mcl_core:ice",              "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:snowblock",        "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:snow 9",           "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:iron_ingot",       "mcl_technic:coal_dust",        "mcl_technic:steel_ingot"},
{"mcl_technic:iron_dust",     "mcl_technic:coal_dust",        "mcl_technic:steel_ingot"},
{"mcl_core:iron_ingot",       "mcl_technic:charcoal_dust",    "mcl_technic:steel_ingot"},
{"mcl_technic:iron_dust",     "mcl_technic:charcoal_dust",    "mcl_technic:steel_ingot"},
{"mcl_pipeworks:oil_extract", "mcl_technic:rubber",           "mcl_mobitems:leather"},
{"mcl_core:gold_ingot 4",     "mcl_nether:netherite_scrap 4", "mcl_nether:netherite_ingot"},
}

for _, data in pairs(recipes) do
	mcl_technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
