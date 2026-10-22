execute if block ~ ~ ~ minecraft:verdant_froglight align xyz positioned ~0.5 ~ ~0.5 unless entity @e[type=marker,tag=buffoon.stone,distance=..0.6] run return run function buffoon:stones/gas_giant/setup
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..70 positioned ^ ^ ^0.1 run function buffoon:stones/gas_giant/ray
