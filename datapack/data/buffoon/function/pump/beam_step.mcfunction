particle minecraft:dust{color:[0.2,0.5,1.0],scale:2.2f} ~ ~ ~ 0.08 0.08 0.08 0 2 force @a
particle minecraft:dust{color:[0.75,0.9,1.0],scale:1.4f} ~ ~ ~ 0.12 0.12 0.12 0 1 force @a
particle minecraft:bubble_pop ~ ~ ~ 0.15 0.15 0.15 0.01 1 force @a
scoreboard players operation #m buffoon.pump = #ray buffoon.pump
scoreboard players operation #m buffoon.pump += #phase buffoon.pump
scoreboard players operation #m buffoon.pump %= #6 buffoon.pump
execute if score #m buffoon.pump matches 0 run particle minecraft:dust{color:[1.0,1.0,1.0],scale:3.0f} ~ ~ ~ 0.15 0.15 0.15 0 3 force @a
execute if score #m buffoon.pump matches 0 run particle minecraft:splash ~ ~ ~ 0.25 0.25 0.25 0 4 force @a
scoreboard players add #ray buffoon.pump 1
execute if entity @n[type=marker,tag=buffoon.pump_nozzle,distance=..0.8] run return run function buffoon:pump/geyser
execute if score #ray buffoon.pump matches ..400 positioned ^ ^ ^0.5 run function buffoon:pump/beam_step
