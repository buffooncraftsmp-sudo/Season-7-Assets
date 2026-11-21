# Runs at the twin's last position (macro args = its side, name, colour)
$scoreboard players set #$(side) buffoon.twins 2
$bossbar remove buffoon:twin_$(side)
$kill @e[type=marker,tag=buffoon.twin_anchor_$(side)]
$function buffoon:twins/despawn_mobs {side:"$(side)"}
$summon item ~ ~0.5 ~ {Item:{id:"minecraft:ominous_trial_key",count:1},Tags:["buffoon.twin_drop","buffoon.twin_drop_$(side)"],PickupDelay:20,Age:-32768,Glowing:1b}
particle minecraft:nautilus ~ ~1 ~ 1.5 1.5 1.5 1 250 force @a
particle minecraft:bubble_column_up ~ ~ ~ 1.5 1.5 1.5 0.3 200 force @a
playsound minecraft:entity.drowned.death hostile @a[distance=..64] ~ ~ ~ 3 0.5
playsound minecraft:block.vault.insert_item master @a[distance=..64] ~ ~ ~ 1 0.8
$title @a[distance=..64] title {text:"$(name) has fallen",color:"$(color)",bold:true}
title @a[distance=..64] subtitle {text:"An Ominous Trial Key is left behind",color:"gray",italic:true}
$tellraw @a [{text:"✦ ",color:"$(color)"},{text:"$(name) has been defeated! An Ominous Trial Key sinks to the floor.",color:"$(color)"}]
execute if score #west buffoon.twins matches 2 if score #east buffoon.twins matches 2 run function buffoon:twins/both_down
