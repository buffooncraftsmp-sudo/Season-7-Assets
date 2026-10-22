scoreboard players operation #sm buffoon.boss = #sr buffoon.boss
scoreboard players operation #sm buffoon.boss += #sphase buffoon.boss
scoreboard players operation #sm buffoon.boss %= #4 buffoon.boss
$execute if score #sm buffoon.boss matches 0 run particle minecraft:dust{color:$(c),scale:1.3f} ~ ~ ~ 0.15 0.15 0.15 0 1 force @a
$execute if score #sm buffoon.boss matches 0 run particle $(p) ~ ~ ~ 0.2 0.2 0.2 0 1 force @a
scoreboard players add #sr buffoon.boss 1
execute if entity @n[type=item_display,tag=buffoon.boss_star,distance=..1] run return run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.02 2 force @a
$execute if score #sr buffoon.boss matches ..200 positioned ^ ^ ^0.6 run function buffoon:boss/stream_step {c:"$(c)",p:"$(p)"}
