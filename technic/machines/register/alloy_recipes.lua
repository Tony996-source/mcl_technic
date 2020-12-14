
local S = technic.getter

technic.register_recipe_type("alloy", {
	description = S("Alloying"),
	input_size = 2,
})

function technic.register_alloy_recipe(data)
	data.time = data.time or 6
	technic.register_recipe("alloy", data)
end

local recipes = {
{"mcl_core:sand", "technic:coal_dust", "technic:silicon_wafer 2"},
{"technic:silicon_wafer", "technic:gold_dust", "technic:doped_silicon_wafer 2"},
{"mcl_core:obsidian", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_lava"},
{"mcl_core:ice", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_water"},
{"mcl_core:snowblock", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_water"},
{"mcl_core:snow 9", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_water"},
}

for _, data in pairs(recipes) do
	technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
