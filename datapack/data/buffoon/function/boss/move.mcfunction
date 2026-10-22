execute if score #still buffoon.boss matches 1.. run return 0
scoreboard players remove #mv buffoon.boss 1
execute if score #mv buffoon.boss matches 1.. run return 0
execute if score #state buffoon.boss matches 2 run scoreboard players set #mv buffoon.boss 160
execute if score #state buffoon.boss matches 4 run scoreboard players set #mv buffoon.boss 100
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:reverse_portal ~ ~2 ~ 1.5 2 1.5 0.2 150 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.illusioner.mirror_move hostile @a[distance=..120] ~ ~ ~ 4 0.7
execute as @n[type=marker,tag=buffoon.boss_orbit] at @s run tp @s ~ ~ ~ ~170 ~
execute store result score #dir buffoon.boss run random value 0..1
