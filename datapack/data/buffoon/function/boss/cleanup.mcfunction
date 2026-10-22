kill @e[tag=buffoon.boss_ent]
kill @e[type=vex,tag=buffoon.boss_wisp]
bossbar remove buffoon:boss
scoreboard players set #state buffoon.boss 0
tag @a remove buffoon.wave_hit
scoreboard players set #still buffoon.boss 0
