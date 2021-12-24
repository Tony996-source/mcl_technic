
-- Aliases to convert from legacy node/item names

mcl_technic.legacy_nodenames = {
	["mcl_technic:alloy_furnace"]        = "mcl_technic:lv_alloy_furnace",
	["mcl_technic:alloy_furnace_active"] = "mcl_technic:lv_alloy_furnace_active",
	["mcl_technic:battery_box"]  = "mcl_technic:lv_battery_box0",
	["mcl_technic:battery_box1"] = "mcl_technic:lv_battery_box1",
	["mcl_technic:battery_box2"] = "mcl_technic:lv_battery_box2",
	["mcl_technic:battery_box3"] = "mcl_technic:lv_battery_box3",
	["mcl_technic:battery_box4"] = "mcl_technic:lv_battery_box4",
	["mcl_technic:battery_box5"] = "mcl_technic:lv_battery_box5",
	["mcl_technic:battery_box6"] = "mcl_technic:lv_battery_box6",
	["mcl_technic:battery_box7"] = "mcl_technic:lv_battery_box7",
	["mcl_technic:battery_box8"] = "mcl_technic:lv_battery_box8",
	["mcl_technic:electric_furnace"]        = "mcl_technic:lv_electric_furnace",
	["mcl_technic:electric_furnace_active"] = "mcl_technic:lv_electric_furnace_active",
	["mcl_technic:grinder"]        = "mcl_technic:lv_grinder",
	["mcl_technic:grinder_active"] = "mcl_technic:lv_grinder_active",
	["mcl_technic:extractor"]        = "mcl_technic:lv_extractor",
	["mcl_technic:extractor_active"] = "mcl_technic:lv_extractor_active",
	["mcl_technic:compressor"]        = "mcl_technic:lv_compressor",
	["mcl_technic:compressor_active"] = "mcl_technic:lv_compressor_active",
	["mcl_technic:hv_battery_box"] = "mcl_technic:hv_battery_box0",
	["mcl_technic:mv_battery_box"] = "mcl_technic:mv_battery_box0",
	["mcl_technic:generator"]        = "mcl_technic:lv_generator",
	["mcl_technic:generator_active"] = "mcl_technic:lv_generator_active",
	["mcl_technic:iron_dust"] = "mcl_technic:wrought_iron_dust",
	["mcl_technic:enriched_uranium"] = "mcl_technic:uranium35_ingot",
}

for old, new in pairs(mcl_technic.legacy_nodenames) do
	minetest.register_alias(old, new)
end

for i = 0, 64 do
	minetest.register_alias("mcl_technic:hv_cable"..i, "mcl_technic:hv_cable")
	minetest.register_alias("mcl_technic:mv_cable"..i, "mcl_technic:mv_cable")
	minetest.register_alias("mcl_technic:lv_cable"..i, "mcl_technic:lv_cable")
end

