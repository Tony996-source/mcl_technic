-- Configuration
local vacuum_max_charge        = 1000000 -- 1000000 - Maximum charge of the vacuum cleaner
local vacuum_charge_per_object = 100   -- 100   - Capable of picking up 50 objects
local vacuum_range             = 10     -- 10     - Area in which to pick up objects

local S = mcl_technic.getter

mcl_technic.register_power_tool("mcl_technic:vacuum_hv", vacuum_max_charge)

minetest.register_tool("mcl_technic:vacuum_hv", {
	description = S("HV Vacuum Cleaner"),
	inventory_image = "mcl_technic_vacuum_hv.png",
	stack_max = 1,
	wear_represents = "mcl_technic_RE_charge",
	on_refill = mcl_technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
		local meta = minetest.deserialize(itemstack:get_metadata())
		if not meta or not meta.charge then
			return
		end
		if meta.charge > vacuum_charge_per_object then
			minetest.sound_play("vacuumcleaner", {
				to_player = user:get_player_name(),
				gain = 0.4,
			})
		end
		local pos = user:getpos()
		local inv = user:get_inventory()
		for _, object in ipairs(minetest.get_objects_inside_radius(pos, vacuum_range)) do
			local luaentity = object:get_luaentity()
			if not object:is_player() and luaentity and luaentity.name == "__builtin:item" and luaentity.itemstring ~= "" then
				if inv and inv:room_for_item("main", ItemStack(luaentity.itemstring)) then
					meta.charge = meta.charge - vacuum_charge_per_object
					if meta.charge < vacuum_charge_per_object then
						return
					end
					inv:add_item("main", ItemStack(luaentity.itemstring))
					minetest.sound_play("item_drop_pickup", {
						to_player = user:get_player_name(),
						gain = 0.4,
					})
					luaentity.itemstring = ""
					object:remove()
				end
			end
		end
		
		mcl_technic.set_RE_wear(itemstack, meta.charge, vacuum_max_charge)
		itemstack:set_metadata(minetest.serialize(meta))
		return itemstack
	end,
})

minetest.register_craft({
	output = 'mcl_technic:vacuum_hv',
	recipe = {
	{'mcl_technic:vacuum_mv',      'mcl_technic:carbon_plate',   'mcl_technic:steel_ingot'},
	{'mcl_technic:rubber',         'mcl_core:gold_ingot',        'mcl_technic:battery'},
	{'mcl_technic:steel_ingot',    'mcl_technic:steel_ingot',    ''},
	}
})
