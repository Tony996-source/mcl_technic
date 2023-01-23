# technic_transporter
This mod adds a technic-powered, highly configurable transporter.  

![Screenshot](screenshot.png)

## Dependencies

- Minetest 0.4.16+
- Minetest_game 0.4.16+
- [technic](https://github.com/minetest-mods/technic)

## Recommended mods

- [craftguide](https://github.com/minetest-mods/craftguide) (To see available crafting recipes)

## Usage

Simply connect the transporter to a technic power network.    

Right-clicking it brings a transporter menu, where you can set the target coordinates (don't forget to click set to actually set the coordinates), bookmarks menu and other settings.  

The transporter establishes a portal between two points, teleporting any players and remaining
active as long as enough energy is supplied.  

The transport cost is calculated based on distance between the points multiplied by per-node modifier (20 by default) and two-way modifier (if the portal is two-way, twice as much energy is used).  

One-way checkbox enables the transporter to automatically shutdown after one teleportation (from any side).  

You can save bookmarks from a transporter node by right-clicking it with a blank floppy disk. It will become blue and right-clicking any transporter node will add bookmarks stored on this floppy to the transporter.  

## Settingtypes
Modpack provides some settings, accessible via "Settings->All Settings->Mods->technic_transporter  
You can also put these settings directly to your minetest.conf:

```
transporter_multiplier = 20, int, cost of transport per node
transporter_two_way_multiplier = 2, int, multiplier of two-way cost
transporter_minimum_y = -31000, int
transporter_maximum_y = 31000, int
transporter_minimum_z = -31000, int
transporter_maximum_z = 31000, int
transporter_minimum_x = -31000, int
transporter_maximum_x = 31000, int

```

## License
All code is GPLv3 [link to the license](https://www.gnu.org/licenses/gpl-3.0.en.html)  
All resources not covered in the "credits" section are licensed under CC BY 4.0 [link to the license](https://creativecommons.org/licenses/by/4.0/legalcode)  