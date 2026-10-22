# Puts a placed Astronomer's Stone of The Comet (light + spinning core) at the core centre
kill @e[tag=buffoon.stone_comet,distance=..1.5]
setblock ~ ~ ~ minecraft:light[level=15]
summon marker ~ ~ ~ {Tags:["buffoon.stone","buffoon.stone_comet","buffoon.core_stone"]}
summon interaction ~ ~0.1 ~ {Tags:["buffoon.stone_hitbox","buffoon.stone_comet","buffoon.core_stone"],width:0.8f,height:0.8f,response:true}
summon item_display ~ ~0.5 ~ {Tags:["buffoon.stone_display","buffoon.stone_comet","buffoon.core_stone"],item:{id:"minecraft:gilded_blackstone",count:1},billboard:"fixed",teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]}}
particle minecraft:wax_on ~ ~0.5 ~ 0.5 0.5 0.5 0 40 force @a
