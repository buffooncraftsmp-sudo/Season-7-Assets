execute if block ~ ~ ~ minecraft:cartography_table align xyz positioned ~0.5 ~0.5 ~0.5 run return run function buffoon:ufo/nav/check
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..70 positioned ^ ^ ^0.1 run function buffoon:ufo/nav/ray
