particle minecraft:dust{color:[1.0,0.15,0.15],scale:0.5f} ~ ~ ~ 0 0 0 0 1 force @a
scoreboard players add #r buffoon.boss 1
execute if entity @e[type=marker,tag=buffoon.lock_aim,distance=..1] run return 0
execute if score #r buffoon.boss matches ..120 positioned ^ ^ ^1 run function buffoon:boss/aim_step
