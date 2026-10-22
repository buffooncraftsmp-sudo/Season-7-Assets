execute if block ~ ~ ~ minecraft:lodestone align xyz positioned ~0.5 ~0.5 ~0.5 run return run function buffoon:nexus/setup
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..70 positioned ^ ^ ^0.1 run function buffoon:nexus/ray
