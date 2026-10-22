execute if block ~ ~1 ~ minecraft:water run setblock ~ ~ ~ minecraft:light[level=12,waterlogged=true]
execute unless block ~ ~ ~ minecraft:light run setblock ~ ~ ~ minecraft:light[level=12]
summon marker ~ ~ ~ {Tags:["buffoon.trophy","buffoon.trophy_eve"]}
summon interaction ~ ~0.1 ~ {Tags:["buffoon.trophy_hitbox","buffoon.trophy_eve"],width:0.8f,height:0.9f,response:true}
summon item_display ~ ~0.55 ~ {Tags:["buffoon.trophy_display","buffoon.trophy_eve"],item:{id:"minecraft:nether_star",count:1},Glowing:1b,glow_color_override:11832575,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.85f,0.85f,0.85f]}}
summon text_display ~ ~1.25 ~ {Tags:["buffoon.trophy_label","buffoon.trophy_eve"],billboard:"center",background:0,shadow:1b,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},text:[{text:"Eve",color:"gold",bold:true},{text:"\nSlayer of the Astronomer",color:"#B48CFF"}]}
particle minecraft:end_rod ~ ~0.6 ~ 0.3 0.3 0.3 0.05 30 force @a
playsound minecraft:block.amethyst_block.resonate block @a ~ ~ ~ 1 1
