scoreboard players set #state buffoon.boss 5
scoreboard players set #bt buffoon.boss 0
bossbar remove buffoon:boss
kill @e[tag=buffoon.boss_strike]
kill @e[tag=buffoon.boss_gas]
kill @e[tag=buffoon.boss_lock]
kill @e[tag=buffoon.boss_wave]
kill @e[type=vex,tag=buffoon.boss_wisp]
kill @e[type=marker,tag=buffoon.boss_sweep]
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.ender_dragon.death master @a[distance=..200] ~ ~ ~ 8 1
execute as @e[type=mannequin,tag=buffoon.boss,limit=1] at @s run tellraw @a[distance=..150] [{text:"The Astronomer: ",color:"#B48CFF",bold:true},{text:"Impossible... this was not... calculated...",color:"white",italic:true}]
