local S = technic.getter
local moretrees = minetest.get_modpath("moretrees")
local dye = minetest.get_modpath("dye")

-- sawdust, the finest wood/tree grinding
local sawdust = "technic:sawdust"
minetest.register_craftitem(sawdust, {
	description = S("Sawdust"),
	inventory_image = "technic_sawdust.png",
})
minetest.register_craft({ type = "fuel", recipe = sawdust, burntime = 6 })

-- tree/wood grindings
local function register_tree_grinding(name, tree, wood, extract, grinding_color)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	local grindings_name = "technic:"..lname.."_grindings"
	local inventory_image = "technic_"..lname.."_grindings.png"
	if grinding_color then
		inventory_image = inventory_image .. "^[colorize:" .. grinding_color
	end
	minetest.register_craftitem(grindings_name, {
		description = S("%s Grinding"):format(S(name)),
		inventory_image = inventory_image,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = grindings_name,
		burntime = 8,
	})
	technic.register_grinder_recipe({ input = { tree }, output = grindings_name .. " 4" })
	technic.register_grinder_recipe({ input = { grindings_name }, output = sawdust .. " 4" })
	if wood then
		technic.register_grinder_recipe({ input = { wood }, output = grindings_name })
	end
	if extract then
		technic.register_extractor_recipe({ input = { grindings_name .. " 4" }, output = extract})
	end
end

