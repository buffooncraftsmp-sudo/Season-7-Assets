execute if block ~ ~ ~ minecraft:lime_stained_glass align xyz positioned ~0.5 ~0.5 ~0.5 run return run function buffoon:ufo/emitter/setup
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..70 positioned ^ ^ ^0.1 run function buffoon:ufo/emitter/ray
