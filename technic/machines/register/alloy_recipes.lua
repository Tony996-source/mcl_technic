
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
{"mcl_core:iron_ingot", "technic:coal_dust", "technic:steel_ingot"},
{"technic:iron_dust", "technic:coal_dust", "technic:steel_ingot"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_white", "mcl_colorblocks:concrete_white"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_grey", "mcl_colorblocks:concrete_grey"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_silver", "mcl_colorblocks:concrete_silver"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_black", "mcl_colorblocks:concrete_black"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_red", "mcl_colorblocks:concrete_red"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_yellow", "mcl_colorblocks:concrete_yellow"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_green", "mcl_colorblocks:concrete_green"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_cyan", "mcl_colorblocks:concrete_cyan"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_blue", "mcl_colorblocks:concrete_blue"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_magenta", "mcl_colorblocks:concrete_magenta"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_orange", "mcl_colorblocks:concrete_orange"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_purple", "mcl_colorblocks:concrete_purple"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_brown", "mcl_colorblocks:concrete_brown"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_pink", "mcl_colorblocks:concrete_pink"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_lime", "mcl_colorblocks:concrete_lime"},
{"mcl_core:ice", "mcl_colorblocks:concrete_powder_light_blue", "mcl_colorblocks:concrete_light_blue"},
}

for _, data in pairs(recipes) do
	technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
