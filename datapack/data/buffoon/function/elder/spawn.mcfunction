# Spawns the Coralline Elder where this runs - must be in water. Ops or a command block:
#   function buffoon:elder/spawn
# (or place the spawner from buffoon:elder/give_spawner)
execute if score #state buffoon.elder matches 1 run return run tellraw @s {text:"The Coralline Elder is already alive.",color:"red"}
execute if score #state buffoon.elder matches 2 run return run tellraw @s {text:"The Coralline Elder has already been beaten - run /function buffoon:elder/reset first.",color:"red"}
execute unless block ~ ~ ~ #buffoon:elder_water run return run tellraw @s {text:"Spawn it in water - the Elder can't survive on land.",color:"red"}
# 3x a vanilla Elder Guardian: 80 -> 240 health, 8 -> 24 attack damage
summon elder_guardian ~ ~ ~ {Tags:["buffoon.elder_new"],CustomName:{text:"The Coralline Elder",color:"#3FD8E0",bold:true},Health:240f,attributes:[{id:"minecraft:max_health",base:240.0d},{id:"minecraft:attack_damage",base:24.0d},{id:"minecraft:follow_range",base:32.0d}]}
execute as @n[type=elder_guardian,tag=buffoon.elder_new] at @s run function buffoon:elder/adopt
