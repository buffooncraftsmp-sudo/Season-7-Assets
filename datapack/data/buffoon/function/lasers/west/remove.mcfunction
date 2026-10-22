setblock ~ ~ ~ minecraft:air
scoreboard players set #west buffoon.laser 0
particle minecraft:reverse_portal ~ ~ ~ 0.4 0.4 0.4 0.05 30 force @a
forceload remove ~ ~
kill @s
