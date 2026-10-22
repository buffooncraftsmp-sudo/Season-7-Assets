particle minecraft:dust{color:[0.25,0.55,1.0],scale:1.6f} ~ ~ ~ 0.2 0.2 0.2 0 2 force @a
particle minecraft:dust{color:[1.0,1.0,1.0],scale:1.2f} ~ ~ ~ 0.2 0.2 0.2 0 1 force @a
particle minecraft:splash ~ ~ ~ 0.2 0.2 0.2 0 2 force @a
particle minecraft:bubble_pop ~ ~ ~ 0.15 0.15 0.15 0.02 1 force @a
scoreboard players add #ray buffoon.pump 1
execute if entity @n[type=marker,tag=buffoon.pump_nozzle,distance=..1] run return run particle minecraft:splash ~ ~ ~ 0.3 0.3 0.3 0 10 force @a
execute if score #ray buffoon.pump matches ..300 positioned ^ ^ ^0.5 run function buffoon:pump/suck_step
