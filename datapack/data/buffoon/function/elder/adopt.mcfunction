# Turns a freshly spawned Elder (from the command or the trial spawner) into the live boss
tag @s remove buffoon.elder_new
# already alive or already beaten - a spawner can't make a second one or a second hoard
execute unless score #state buffoon.elder matches 0 run return run tp @s ~ -1000 ~
scoreboard players set #state buffoon.elder 1
scoreboard players set #t buffoon.elder 0
tag @s add buffoon.elder
tag @s add buffoon.elder_mob
data merge entity @s {PersistenceRequired:1b}
kill @e[type=marker,tag=buffoon.elder_anchor]
summon marker ~ ~ ~ {Tags:["buffoon.elder_anchor"]}
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
