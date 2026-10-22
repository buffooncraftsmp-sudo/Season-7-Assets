execute unless block ~ ~-1 ~ minecraft:air run return 0
scoreboard players add #g buffoon.boss 1
execute if score #g buffoon.boss matches 200.. run return 0
tp @s ~ ~-1 ~
execute at @s run function buffoon:boss/ground_step
