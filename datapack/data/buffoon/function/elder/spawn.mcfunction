# Spawns the Coralline Elder where this runs - must be in water. Ops or a command block:
#   function buffoon:elder/spawn
execute if score #state buffoon.elder matches 1 run return run tellraw @s {text:"The Coralline Elder is already alive.",color:"red"}
execute if score #state buffoon.elder matches 2 run return run tellraw @s {text:"The Coralline Elder has already been beaten - run /function buffoon:elder/reset first.",color:"red"}
execute unless block ~ ~ ~ #buffoon:elder_water run return run tellraw @s {text:"Spawn it in water - the Elder can't survive on land.",color:"red"}
scoreboard players set #state buffoon.elder 1
scoreboard players set #t buffoon.elder 0
kill @e[type=marker,tag=buffoon.elder_anchor]
summon marker ~ ~ ~ {Tags:["buffoon.elder_anchor"]}
# 3x a vanilla Elder Guardian: 80 -> 240 health, 8 -> 24 attack damage
summon elder_guardian ~ ~ ~ {Tags:["buffoon.elder","buffoon.elder_mob"],PersistenceRequired:1b,CustomName:{text:"The Coralline Elder",color:"#3FD8E0",bold:true},Health:240f,attributes:[{id:"minecraft:max_health",base:240.0d},{id:"minecraft:attack_damage",base:24.0d},{id:"minecraft:follow_range",base:32.0d}]}
bossbar remove buffoon:elder
bossbar add buffoon:elder {text:"The Coralline Elder",color:"#3FD8E0",bold:true}
bossbar set buffoon:elder max 240
bossbar set buffoon:elder value 240
bossbar set buffoon:elder color blue
bossbar set buffoon:elder style notched_10
bossbar set buffoon:elder players @a[distance=..64]
title @a[distance=..64] title {text:"The Coralline Elder",color:"#3FD8E0",bold:true}
title @a[distance=..64] subtitle {text:"Guardian of the Deep",color:"gray",italic:true}
particle minecraft:nautilus ~ ~ ~ 2 2 2 1 300 force @a
particle minecraft:bubble_column_up ~ ~ ~ 2 2 2 0.2 200 force @a
playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..64] ~ ~ ~ 4 0.6
playsound minecraft:entity.elder_guardian.ambient hostile @a[distance=..64] ~ ~ ~ 4 0.5
