# Removes a twin and its guardians without loot
$execute as @e[tag=buffoon.twin_mob_$(side)] at @s run particle minecraft:bubble_pop ~ ~0.5 ~ 0.4 0.4 0.4 0.05 20
$execute as @e[tag=buffoon.twin_mob_$(side)] run data merge entity @s {DeathLootTable:"minecraft:empty"}
$kill @e[tag=buffoon.twin_mob_$(side)]
