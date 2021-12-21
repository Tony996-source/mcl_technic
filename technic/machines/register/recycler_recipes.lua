
local S = technic.getter

technic.register_recipe_type("recycling", { 
    description = S("Recycling") 
})

function technic.register_recycler_recipe(data)
	data.time = data.time or 5
	technic.register_recipe("recycling", data)
end

-- register recipes
local recipes = {
	{"technic:hv_alloy_furnace","mcl_nether:netherite_scrap"},
	{"technic:hv_battery_box","mcl_nether:netherite_scrap"},
	{"technic:hv_compressor","mcl_nether:netherite_scrap"},
	{"technic:hv_electric_furnace","mcl_nether:netherite_scrap"},
	{"technic:hv_extractor","mcl_nether:netherite_scrap"},
	{"technic:hv_freezer","mcl_nether:netherite_scrap"},
	{"technic:hv_generator","mcl_nether:netherite_scrap"},
	{"technic:hv_grinder", "mcl_nether:netherite_scrap"},
	{"technic:hv_quarry", "mcl_nether:netherite_scrap"},
	{"technic:hv_recycler", "mcl_nether:netherite_scrap"},
	{"technic:hv_sawmill", "mcl_nether:netherite_scrap"},
	{"technic:hv_solar_array", "mcl_nether:netherite_scrap"},
	{"technic:tool_workshop_hv", "mcl_nether:netherite_scrap"},
	{"technic:chainsaw_hv", "mcl_nether:netherite_scrap"},
	{"technic:vacuum_hv", "mcl_nether:netherite_scrap"},
}


    
	for _, data in ipairs(recipes) do
		technic.register_recycler_recipe({input = {data[1]}, output = data[2]})
	end
