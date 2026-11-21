$tag @s remove buffoon.twin_new_$(side)
# already alive or already beaten - a spawner can't make a second one or a second key
$execute unless score #$(side) buffoon.twins matches 0 run return run tp @s ~ -1000 ~
$scoreboard players set #$(side) buffoon.twins 1
$scoreboard players set #$(side).t buffoon.twins 0
tag @s add buffoon.twin
$tag @s add buffoon.twin_$(side)
tag @s add buffoon.twin_mob
$tag @s add buffoon.twin_mob_$(side)
data merge entity @s {PersistenceRequired:1b,CanPickUpLoot:0b}
$kill @e[type=marker,tag=buffoon.twin_anchor_$(side)]
$summon marker ~ ~ ~ {Tags:["buffoon.twin_anchor","buffoon.twin_anchor_$(side)"]}
$bossbar remove buffoon:twin_$(side)
$bossbar add buffoon:twin_$(side) {text:"$(name)",color:"$(color)",bold:true}
$bossbar set buffoon:twin_$(side) max 150
$bossbar set buffoon:twin_$(side) value 150
$bossbar set buffoon:twin_$(side) color $(bar)
$bossbar set buffoon:twin_$(side) style notched_10
$bossbar set buffoon:twin_$(side) players @a[distance=..48]
$title @a[distance=..48] title {text:"$(name)",color:"$(color)",bold:true}
$title @a[distance=..48] subtitle {text:"$(title)",color:"gray",italic:true}
particle minecraft:nautilus ~ ~1 ~ 1 1.5 1 1 200 force @a
particle minecraft:bubble_column_up ~ ~ ~ 1.5 1.5 1.5 0.2 150 force @a
playsound minecraft:item.trident.thunder hostile @a[distance=..48] ~ ~ ~ 1 1.4
playsound minecraft:entity.drowned.ambient_water hostile @a[distance=..48] ~ ~ ~ 3 0.5
