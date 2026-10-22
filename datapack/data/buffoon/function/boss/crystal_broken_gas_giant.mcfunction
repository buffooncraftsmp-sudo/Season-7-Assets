scoreboard players set #alive_gas_giant buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_pillar_gas_giant] run particle minecraft:dust{color:[0.85,0.85,0.3],scale:2.5f} ~ ~2 ~ 1.5 1.5 1.5 0 200 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_gas_giant] run particle minecraft:spore_blossom_air ~ ~2 ~ 1.5 1.5 1.5 0.1 120 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_gas_giant] run particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 force @a
kill @e[type=item_display,tag=buffoon.crystal_gas_giant]
execute at @n[type=marker,tag=buffoon.boss_pillar_gas_giant] run kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
playsound minecraft:block.respawn_anchor.deplete master @a[distance=..120] ~ ~ ~ 4 0.6
tellraw @a[distance=..150] [{text:"✦ ",color:"#B8D433"},{text:"The Astronomer's Stone of The Gas Giant has been shattered!",color:"#B8D433"}]
