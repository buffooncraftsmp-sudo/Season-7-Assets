$particle minecraft:dust{color:$(color),scale:2.0f} ~ ~ ~ 0.04 0.04 0.04 0 2 force @a
scoreboard players add @s buffoon.ray 1
execute if entity @n[type=marker,tag=buffoon.laser_core,distance=..1] run return run function buffoon:lasers/beam_hit
execute if score @s buffoon.ray matches ..600 positioned ^ ^ ^0.6 run function buffoon:lasers/beam_step with entity @s data
