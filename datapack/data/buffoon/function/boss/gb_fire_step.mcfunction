particle minecraft:dust{color:[0.25,0.8,1.0],scale:2.2f} ~ ~ ~ 0.08 0.08 0.08 0 2 force @a
particle minecraft:dust{color:[0.85,1.0,1.0],scale:1.0f} ~ ~ ~ 0.1 0.1 0.1 0 1 force @a
particle minecraft:bubble_pop ~ ~ ~ 0.15 0.15 0.15 0.02 1 force @a
execute as @a[distance=..1.1,tag=!buffoon.gb_hit,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/gb_hit
scoreboard players add #r buffoon.boss 1
execute if score #r buffoon.boss matches ..80 positioned ^ ^ ^0.5 run function buffoon:boss/gb_fire_step
