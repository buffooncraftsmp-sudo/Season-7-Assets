particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force @a
scoreboard players operation #m buffoon.boss = #r buffoon.boss
scoreboard players operation #m buffoon.boss %= #3 buffoon.boss
execute if score #m buffoon.boss matches 0 run particle minecraft:large_smoke ~ ~ ~ 0.1 0.1 0.1 0.01 1 force @a
scoreboard players add #r buffoon.boss 1
execute if entity @e[type=marker,tag=buffoon.boss_strike,distance=..1] run return 0
execute if score #r buffoon.boss matches ..80 positioned ^ ^ ^1 run function buffoon:boss/meteor_streak_step
