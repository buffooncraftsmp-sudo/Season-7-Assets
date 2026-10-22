execute if score #state buffoon.boss matches 2 run scoreboard players set #shield buffoon.boss 100
execute if score #state buffoon.boss matches 4 run scoreboard players set #shield buffoon.boss 80
execute if score #state buffoon.boss matches 2 run scoreboard players set #shcd buffoon.boss 400
execute if score #state buffoon.boss matches 4 run scoreboard players set #shcd buffoon.boss 300
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:end_rod ~ ~2 ~ 1.5 2 1.5 0.3 120 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.beacon.power_select hostile @a[distance=..120] ~ ~ ~ 4 1.6
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.amethyst_block.resonate hostile @a[distance=..120] ~ ~ ~ 4 0.6
