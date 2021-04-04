local flowers = {
{"poppy", "mcl_flowers_poppy"},
{"dandelion", "flowers_dandelion_yellow"},
{"oxeye_daisy", "mcl_flowers_oxeye_daisy"},
{"tulip_orange", "flowers_tulip"},
{"tulip_pink", "mcl_flowers_tulip_pink"},
{"tulip_red", "mcl_flowers_tulip_red"},
{"tulip_white", "mcl_flowers_tulip_white"},
{"allium", "mcl_flowers_allium"},
{"azure_bluet", "mcl_flowers_azure_bluet"},
{"blue_orchid", "mcl_flowers_blue_orchid"},
}

for _, flowers in pairs(flowers) do

minetest.override_item("mcl_flowerpots:flower_pot_"..flowers[1], {
  tiles = {
		"[combine:32x32:0,0=mcl_flowerpots_flowerpot.png:0,0="..flowers[2]..".png",
	},
})
end
