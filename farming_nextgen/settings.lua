--
-- The settings section for seeder
--
--
-- 
farmingNG.havetech = minetest.get_modpath("technic")		-- Is technic mod present ? If not use wearout tool instead
--
--
farmingNG.seeder_max_charge      = 900000 			-- Maximum charge of the seeder 
farmingNG.seeder_charge_per_node = 300				-- How much it costs to place a seed
--
farmingNG.chaton = false					-- more verbose chat messages
farmingNG.easy = false						-- easy recipe if technic mod is present
--
farmingNG.harvester_max_charge      = 900000 			-- Maximum charge of the harvester
farmingNG.harvester_charge_per_node = 300 			-- Costs of harvesting one node
farmingNG.harvester_machine 	= true				-- make the tool available
farmingNG.harvester_nofullg     = true				-- harvests also wheat_7, rice_7 etc no need to wait until full grown 

