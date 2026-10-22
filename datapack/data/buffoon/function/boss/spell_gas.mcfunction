execute at @n[type=mannequin,tag=buffoon.boss] run summon marker ~ ~ ~ {Tags:["buffoon.boss_gas","buffoon.boss_ent"]}
execute if score #state buffoon.boss matches 4 at @n[type=mannequin,tag=buffoon.boss] run summon marker ~ ~ ~ {Tags:["buffoon.boss_gas","buffoon.boss_ent"]}
execute as @e[type=marker,tag=buffoon.boss_gas] at @s run spreadplayers ~ ~ 0 3 under 200 false @s
