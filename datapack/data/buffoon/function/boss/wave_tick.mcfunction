scoreboard players add @s buffoon.boss 1
execute unless score #still buffoon.boss matches 1.. run return run kill @s
scoreboard players operation #gb buffoon.boss = @s buffoon.boss
scoreboard players operation #gb buffoon.boss %= #gbn buffoon.boss
execute if score #gb buffoon.boss matches 1 run kill @e[type=marker,tag=buffoon.gb_target]
execute if score #gb buffoon.boss matches 1 run tag @a remove buffoon.gb_hit
execute if score #gb buffoon.boss matches 1 at @n[type=mannequin,tag=buffoon.boss] as @a[distance=..120,gamemode=!spectator,sort=random,limit=1] at @s run summon marker ~ ~1 ~ {Tags:["buffoon.gb_target","buffoon.boss_ent"]}
execute if score #gb buffoon.boss matches 1 at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.guardian.attack hostile @a[distance=..120] ~ ~ ~ 4 0.8
execute if score #gb buffoon.boss matches 1..12 at @n[type=mannequin,tag=buffoon.boss] positioned ~ ~3.6 ~ facing entity @n[type=marker,tag=buffoon.gb_target] feet run function buffoon:boss/gb_warn
execute if score #gb buffoon.boss matches 13..24 at @n[type=mannequin,tag=buffoon.boss] positioned ~ ~3.6 ~ facing entity @n[type=marker,tag=buffoon.gb_target] feet run function buffoon:boss/gb_fire
execute if score #gb buffoon.boss matches 13 at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.elder_guardian.hurt hostile @a[distance=..120] ~ ~ ~ 3 1.4
