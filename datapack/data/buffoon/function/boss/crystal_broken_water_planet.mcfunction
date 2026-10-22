scoreboard players set #alive_water_planet buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_pillar_water_planet] run particle minecraft:dust{color:[0.3,0.85,1.0],scale:2.5f} ~ ~2 ~ 1.5 1.5 1.5 0 200 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_water_planet] run particle minecraft:nautilus ~ ~2 ~ 1.5 1.5 1.5 0.1 120 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_water_planet] run particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 force @a
kill @e[type=item_display,tag=buffoon.crystal_water_planet]
execute at @n[type=marker,tag=buffoon.boss_pillar_water_planet] run kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
playsound minecraft:block.respawn_anchor.deplete master @a[distance=..120] ~ ~ ~ 4 0.6
tellraw @a[distance=..150] [{text:"✦ ",color:"#3FD8E0"},{text:"The Astronomer's Stone of The Water Planet has been shattered!",color:"#3FD8E0"}]
