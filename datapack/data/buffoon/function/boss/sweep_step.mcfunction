particle minecraft:dust{color:[0.95,0.15,0.1],scale:1.8f} ~ ~ ~ 0.05 0.05 0.05 0 1 force @a
scoreboard players operation #m buffoon.boss = #r buffoon.boss
scoreboard players operation #m buffoon.boss %= #4 buffoon.boss
execute if score #m buffoon.boss matches 0 run particle minecraft:flame ~ ~ ~ 0.05 0.05 0.05 0 1 force @a
execute positioned ~-0.6 ~-0.4 ~-0.6 as @a[dx=0.2,dy=0.4,dz=0.2,tag=!buffoon.swept,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/sweep_hit
scoreboard players add #r buffoon.boss 1
execute if score #r buffoon.boss matches ..60 positioned ^ ^ ^0.5 run function buffoon:boss/sweep_step
