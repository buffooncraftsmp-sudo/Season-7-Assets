$scoreboard players set #$(side).t buffoon.twins 0
execute unless entity @a[distance=..32,gamemode=!spectator] run return 0
$execute store result score #n buffoon.twins if entity @e[tag=buffoon.twin_minion_$(side),distance=..48]
execute if score #n buffoon.twins matches 6.. run return 0
$summon guardian ~ ~1 ~ {Tags:["buffoon.twin_mob","buffoon.twin_mob_$(side)","buffoon.twin_minion_$(side)"],PersistenceRequired:1b,Motion:[0.4d,0.2d,0.0d]}
$summon guardian ~ ~1 ~ {Tags:["buffoon.twin_mob","buffoon.twin_mob_$(side)","buffoon.twin_minion_$(side)"],PersistenceRequired:1b,Motion:[-0.4d,0.2d,0.0d]}
particle minecraft:nautilus ~ ~1 ~ 1 1 1 0.5 80 force @a
playsound minecraft:entity.guardian.ambient hostile @a[distance=..32] ~ ~ ~ 2 0.7
playsound minecraft:entity.drowned.ambient_water hostile @a[distance=..32] ~ ~ ~ 2 0.6
