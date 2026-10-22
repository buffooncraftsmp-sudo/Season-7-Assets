kill @e[tag=buffoon.crystal_gas_giant]
kill @e[type=end_crystal,distance=..4]
kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
summon end_crystal ~ ~ ~ {Tags:["buffoon.boss_crystal","buffoon.crystal_gas_giant","buffoon.boss_ent"],ShowBottom:0b,beam_target:[I;0,0,0]}
summon item_display ~ ~2.6 ~ {Tags:["buffoon.boss_stone","buffoon.crystal_gas_giant","buffoon.boss_ent"],item:{id:"minecraft:potent_sulfur",count:1},Glowing:1b,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.9f,0.9f,0.9f]}}
scoreboard players set #alive_gas_giant buffoon.boss 1
particle minecraft:dust{color:[0.85,0.85,0.3],scale:2.0f} ~ ~1 ~ 1 1 1 0 80 force @a
particle minecraft:spore_blossom_air ~ ~1 ~ 1 1 1 0 40 force @a
playsound minecraft:block.respawn_anchor.charge master @a[distance=..120] ~ ~ ~ 3 0.8
