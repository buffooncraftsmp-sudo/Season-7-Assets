# Look at the barrel you want the Alien Control Panel hidden in (within 6 blocks)
scoreboard players set @s buffoon.ray 0
execute at @s anchored eyes positioned ^ ^ ^ run function buffoon:ufo/set_barrel/panel_ray
