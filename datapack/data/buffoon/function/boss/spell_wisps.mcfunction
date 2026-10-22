execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:end_rod ~ ~2 ~ 2 2 2 0.1 80 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run summon vex ~2 ~1 ~0 {Tags:["buffoon.boss_wisp","buffoon.boss_ent"],CustomName:{text:"Star Wisp",color:"#B48CFF"},Glowing:1b,life_ticks:500,attributes:[{id:"minecraft:max_health",base:6}],Health:6f}
execute at @n[type=mannequin,tag=buffoon.boss] run summon vex ~-2 ~1 ~0 {Tags:["buffoon.boss_wisp","buffoon.boss_ent"],CustomName:{text:"Star Wisp",color:"#B48CFF"},Glowing:1b,life_ticks:500,attributes:[{id:"minecraft:max_health",base:6}],Health:6f}
execute at @n[type=mannequin,tag=buffoon.boss] run summon vex ~0 ~1 ~2 {Tags:["buffoon.boss_wisp","buffoon.boss_ent"],CustomName:{text:"Star Wisp",color:"#B48CFF"},Glowing:1b,life_ticks:500,attributes:[{id:"minecraft:max_health",base:6}],Health:6f}
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.vex.charge hostile @a[distance=..120] ~ ~ ~ 4 0.6
