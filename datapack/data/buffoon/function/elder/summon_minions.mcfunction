scoreboard players set #t buffoon.elder 0
execute unless entity @a[distance=..48,gamemode=!spectator] run return 0
execute store result score #n buffoon.elder if entity @e[tag=buffoon.elder_minion,distance=..48]
execute if score #n buffoon.elder matches 10.. run return 0
summon drowned ~ ~ ~ {Tags:["buffoon.elder_mob","buffoon.elder_minion"],PersistenceRequired:1b,equipment:{mainhand:{id:"minecraft:trident",count:1}},drop_chances:{mainhand:0.0f},Motion:[0.4d,0.2d,0.0d]}
summon drowned ~ ~ ~ {Tags:["buffoon.elder_mob","buffoon.elder_minion"],PersistenceRequired:1b,Motion:[-0.4d,0.2d,0.0d]}
summon guardian ~ ~ ~ {Tags:["buffoon.elder_mob","buffoon.elder_minion"],PersistenceRequired:1b,Motion:[0.0d,0.2d,0.4d]}
execute if score #hp buffoon.elder matches ..120 run summon guardian ~ ~ ~ {Tags:["buffoon.elder_mob","buffoon.elder_minion"],PersistenceRequired:1b,Motion:[0.0d,0.2d,-0.4d]}
particle minecraft:nautilus ~ ~ ~ 1.5 1.5 1.5 0.5 120 force @a
playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..48] ~ ~ ~ 2 0.8
