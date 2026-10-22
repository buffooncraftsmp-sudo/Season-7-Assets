execute if block ~ ~ ~ minecraft:barrel align xyz positioned ~0.5 ~0.5 ~0.5 run return run function buffoon:ufo/set_barrel/nav_set
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..60 positioned ^ ^ ^0.1 run function buffoon:ufo/set_barrel/nav_ray
execute if score @s buffoon.ray matches 61 run tellraw @s {text:"No barrel found - look straight at it (within 6 blocks).",color:"red"}
