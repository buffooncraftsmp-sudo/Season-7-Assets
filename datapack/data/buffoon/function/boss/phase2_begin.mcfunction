scoreboard players set #state buffoon.boss 3
scoreboard players set #bt buffoon.boss 0
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:sonic_boom ~ ~2 ~ 1 1 1 0 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..150] ~ ~ ~ 8 0.4
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.wither.spawn master @a[distance=..150] ~ ~ ~ 6 0.6
bossbar set buffoon:boss color red
title @a[distance=..150] times 5 60 15
execute at @n[type=marker,tag=buffoon.boss_center] rotated as @n[type=marker,tag=buffoon.boss_orbit] positioned ^ ^ ^9 run tp @n[type=mannequin,tag=buffoon.boss] ~ ~ ~
scoreboard players set #shield buffoon.boss 0
scoreboard players set #shcd buffoon.boss 300
execute at @n[type=marker,tag=buffoon.boss_center] run particle minecraft:explosion_emitter ~ ~1 ~ 1 0 1 0 3 force @a
execute at @n[type=marker,tag=buffoon.boss_center] run playsound minecraft:entity.generic.explode master @a[distance=..150] ~ ~ ~ 6 0.5
title @a[distance=..150] title {text:"PHASE II",color:"dark_red",bold:true}
title @a[distance=..150] subtitle {text:"The stones are reborn...",color:"red",italic:true}
execute as @e[type=mannequin,tag=buffoon.boss,limit=1] at @s run tellraw @a[distance=..150] [{text:"The Astronomer: ",color:"#B48CFF",bold:true},{text:"You are not following the pattern. Very well. I will correct you by hand.",color:"white",italic:true}]
