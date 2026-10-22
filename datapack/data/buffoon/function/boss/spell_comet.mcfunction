execute at @n[type=mannequin,tag=buffoon.boss] as @a[distance=..120,gamemode=!spectator] at @s run function buffoon:boss/meteor_spots
execute as @e[type=marker,tag=buffoon.meteor_new] at @s run spreadplayers ~ ~ 0 3 under 200 false @s
tag @e[type=marker,tag=buffoon.meteor_new] remove buffoon.meteor_new
execute at @n[type=marker,tag=buffoon.boss_center] run playsound minecraft:entity.lightning_bolt.thunder hostile @a[distance=..120] ~ ~ ~ 3 1.6
execute at @n[type=marker,tag=buffoon.boss_center] run playsound minecraft:block.end_portal.spawn hostile @a[distance=..120] ~ ~30 ~ 3 1.6
