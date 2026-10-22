particle minecraft:dust{color:[0.45,1.0,0.25],scale:2.5f} ~ ~ ~ 0.05 0.05 0.05 0 2 force @a
scoreboard players add @s buffoon.ray 1
execute if entity @n[type=marker,tag=buffoon.ufo_target,distance=..1] run return run function buffoon:ufo/beam_hit
execute if score @s buffoon.ray matches ..600 positioned ^ ^ ^0.5 run function buffoon:ufo/beam_step
