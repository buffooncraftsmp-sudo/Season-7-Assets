particle minecraft:dust{color:[0.4,0.9,1.0],scale:0.5f} ~ ~ ~ 0 0 0 0 1 force @a
scoreboard players add #r buffoon.boss 1
execute if score #r buffoon.boss matches ..40 positioned ^ ^ ^1 run function buffoon:boss/gb_warn_step
