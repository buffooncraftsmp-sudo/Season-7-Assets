scoreboard players add #bt buffoon.boss 1
execute as @n[type=mannequin,tag=buffoon.boss] at @s run tp @s ~ ~0.05 ~ ~12 ~
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:end_rod ~ ~2 ~ 1 2 1 0.2 10 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:dust{color:[1.0,0.75,0.2],scale:2.0f} ~ ~2 ~ 1.5 2 1.5 0 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:dust{color:[0.85,0.85,0.3],scale:2.0f} ~ ~2 ~ 1.5 2 1.5 0 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:dust{color:[0.95,0.3,0.15],scale:2.0f} ~ ~2 ~ 1.5 2 1.5 0 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:dust{color:[0.3,0.85,1.0],scale:2.0f} ~ ~2 ~ 1.5 2 1.5 0 6 force @a
execute if score #bt buffoon.boss matches 20 at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:explosion ~ ~2 ~ 1.5 2 1.5 0 6 force @a
execute if score #bt buffoon.boss matches 50 at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:explosion ~ ~2 ~ 1.5 2 1.5 0 10 force @a
execute if score #bt buffoon.boss matches 100.. run function buffoon:boss/victory
