scoreboard players set #alive_mars buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_pillar_mars] run particle minecraft:dust{color:[0.95,0.3,0.15],scale:2.5f} ~ ~2 ~ 1.5 1.5 1.5 0 200 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_mars] run particle minecraft:crimson_spore ~ ~2 ~ 1.5 1.5 1.5 0.1 120 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_mars] run particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 force @a
kill @e[type=item_display,tag=buffoon.crystal_mars]
execute at @n[type=marker,tag=buffoon.boss_pillar_mars] run kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
playsound minecraft:block.respawn_anchor.deplete master @a[distance=..120] ~ ~ ~ 4 0.6
tellraw @a[distance=..150] [{text:"✦ ",color:"#E0452B"},{text:"The Astronomer's Stone of Mars has been shattered!",color:"#E0452B"}]
