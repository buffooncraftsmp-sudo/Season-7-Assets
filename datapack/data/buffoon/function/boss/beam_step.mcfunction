particle minecraft:dust{color:[0.95,0.2,0.1],scale:2.5f} ~ ~ ~ 0.1 0.1 0.1 0 3 force @a
particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.2f} ~ ~ ~ 0.15 0.15 0.15 0 1 force @a
scoreboard players add #r buffoon.boss 1
execute if entity @e[type=marker,tag=buffoon.lock_fire,distance=..1] run return run particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.1 15 force @a
execute if score #r buffoon.boss matches ..240 positioned ^ ^ ^0.5 run function buffoon:boss/beam_step
