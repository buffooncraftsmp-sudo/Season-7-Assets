kill @e[tag=buffoon.boss_portal]
fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:polished_blackstone_bricks
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:crying_obsidian
setblock ~ ~-1 ~ minecraft:sea_lantern
summon marker ~ ~ ~ {Tags:["buffoon.boss_portal","buffoon.boss_ent"]}
summon text_display ~ ~3.2 ~ {Tags:["buffoon.boss_portal_text","buffoon.boss_ent"],billboard:"center",background:0,see_through:1b,text:[{text:"✦ ",color:"#B48CFF"},{text:"Portal Home",color:"gold",bold:true},{text:" ✦",color:"#B48CFF"}]}
particle minecraft:reverse_portal ~ ~1.5 ~ 1 2 1 0.3 300 force @a
playsound minecraft:block.end_portal.spawn master @a[distance=..150] ~ ~ ~ 100 1.2
