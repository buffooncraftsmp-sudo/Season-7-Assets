scoreboard players remove #hp buffoon.boss 1
execute store result bossbar buffoon:boss value run scoreboard players get #hp buffoon.boss
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:enchanted_hit ~ ~2 ~ 0.8 1.5 0.8 0.4 20 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:damage_indicator ~ ~2.5 ~ 0.5 0.8 0.5 0.2 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.wither.hurt hostile @a[distance=..64] ~ ~ ~ 2 1.4
