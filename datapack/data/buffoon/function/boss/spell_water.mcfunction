kill @e[type=marker,tag=buffoon.boss_wave]
kill @e[type=marker,tag=buffoon.gb_target]
execute at @n[type=mannequin,tag=buffoon.boss] run summon marker ~ ~ ~ {Tags:["buffoon.boss_wave","buffoon.boss_ent"]}
execute if score #state buffoon.boss matches 2 run scoreboard players set #still buffoon.boss 130
execute if score #state buffoon.boss matches 4 run scoreboard players set #still buffoon.boss 182
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.elder_guardian.ambient hostile @a[distance=..120] ~ ~ ~ 4 0.6
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:nautilus ~ ~3 ~ 1 1 1 0.5 80 force @a
