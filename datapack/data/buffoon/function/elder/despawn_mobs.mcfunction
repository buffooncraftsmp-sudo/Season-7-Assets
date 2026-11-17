# Removes the Elder and its minions without loot
execute as @e[tag=buffoon.elder_mob] at @s run particle minecraft:bubble_pop ~ ~0.5 ~ 0.4 0.4 0.4 0.05 20
execute as @e[tag=buffoon.elder_mob] run data merge entity @s {DeathLootTable:"minecraft:empty"}
kill @e[tag=buffoon.elder_mob]
