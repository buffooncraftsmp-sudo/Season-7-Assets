scoreboard players set #alive_comet buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_pillar_comet] run particle minecraft:dust{color:[1.0,0.75,0.2],scale:2.5f} ~ ~2 ~ 1.5 1.5 1.5 0 200 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_comet] run particle minecraft:wax_on ~ ~2 ~ 1.5 1.5 1.5 0.1 120 force @a
execute at @n[type=marker,tag=buffoon.boss_pillar_comet] run particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 force @a
kill @e[type=item_display,tag=buffoon.crystal_comet]
execute at @n[type=marker,tag=buffoon.boss_pillar_comet] run kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
playsound minecraft:block.respawn_anchor.deplete master @a[distance=..120] ~ ~ ~ 4 0.6
tellraw @a[distance=..150] [{text:"✦ ",color:"#FFB627"},{text:"The Astronomer's Stone of The Comet has been shattered!",color:"#FFB627"}]
