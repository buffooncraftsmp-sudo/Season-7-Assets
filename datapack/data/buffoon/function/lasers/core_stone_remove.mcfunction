# Silently lifts the core-centre stone (entities first so it does not drop as an item)
kill @e[tag=buffoon.stone_comet,distance=..1.5]
execute if block ~ ~ ~ minecraft:light run setblock ~ ~ ~ minecraft:air
