kill @e[tag=buffoon.crystal_water_planet]
kill @e[type=end_crystal,distance=..4]
kill @e[type=item_display,tag=buffoon.boss_stone,distance=..5]
summon end_crystal ~ ~ ~ {Tags:["buffoon.boss_crystal","buffoon.crystal_water_planet","buffoon.boss_ent"],ShowBottom:0b,beam_target:[I;0,0,0]}
summon item_display ~ ~2.6 ~ {Tags:["buffoon.boss_stone","buffoon.crystal_water_planet","buffoon.boss_ent"],item:{id:"minecraft:conduit",count:1},Glowing:1b,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.9f,0.9f,0.9f]}}
scoreboard players set #alive_water_planet buffoon.boss 1
particle minecraft:dust{color:[0.3,0.85,1.0],scale:2.0f} ~ ~1 ~ 1 1 1 0 80 force @a
particle minecraft:nautilus ~ ~1 ~ 1 1 1 0 40 force @a
playsound minecraft:block.respawn_anchor.charge master @a[distance=..120] ~ ~ ~ 3 0.8
