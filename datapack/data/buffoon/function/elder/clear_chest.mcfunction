# As/at a chest marker: empties and removes the loot chest, putting back the water it replaced
data remove block ~ ~ ~ Items
execute if block ~ ~ ~ minecraft:chest if entity @s[tag=buffoon.elder_chest_water] run setblock ~ ~ ~ minecraft:water
execute if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ minecraft:air
kill @s
