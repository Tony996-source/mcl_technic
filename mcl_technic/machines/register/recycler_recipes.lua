
local S = mcl_technic.getter

mcl_technic.register_recipe_type("recycling", {
    description = S("Recycling") 
})

function mcl_technic.register_recycler_recipe(data)
	data.time = data.time or 5
	mcl_technic.register_recipe("recycling", data)
end

-- register recipes
local recipes = {
	{"mcl_technic:hv_alloy_furnace","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_battery_box","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_compressor","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_electric_furnace","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_extractor","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_freezer","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_generator","mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_grinder", "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_quarry", "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_recycler", "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_sawmill", "mcl_nether:netherite_scrap"},
	{"mcl_technic:solar_array_hv", "mcl_nether:netherite_scrap"},
	{"mcl_technic:tool_workshop_hv", "mcl_nether:netherite_scrap"},
	{"mcl_technic:chainsaw_hv", "mcl_nether:netherite_scrap"},
	{"mcl_technic:vacuum_hv", "mcl_nether:netherite_scrap"},
}


    
	for _, data in ipairs(recipes) do
		mcl_technic.register_recycler_recipe({input = {data[1]}, output = data[2]})
	end
