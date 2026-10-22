# swap the placed block for an invisible light source (waterlogged if placed in water)
execute if block ~ ~1 ~ minecraft:water run setblock ~ ~ ~ minecraft:light[level=15,waterlogged=true]
execute unless block ~ ~ ~ minecraft:light run setblock ~ ~ ~ minecraft:light[level=15]
summon marker ~ ~ ~ {Tags:["buffoon.stone","buffoon.stone_mars"]}
summon interaction ~ ~0.1 ~ {Tags:["buffoon.stone_hitbox","buffoon.stone_mars"],width:0.8f,height:0.8f,response:true}
summon item_display ~ ~0.5 ~ {Tags:["buffoon.stone_display","buffoon.stone_mars"],item:{id:"minecraft:magma_block",count:1},billboard:"fixed",teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]}}
particle minecraft:crimson_spore ~ ~0.5 ~ 0.4 0.4 0.4 0 40
playsound minecraft:block.beacon.activate block @a ~ ~ ~ 1 1.4
tellraw @a [{text:"✦ ",color:"#E0452B"},{selector:"@s"},{text:" has placed the Astronomer's Stone of Mars!",color:"#E0452B"}]
