execute as @e[type=marker,tag=buffoon.laser_north] at @s unless block ~ ~ ~ minecraft:red_stained_glass run function buffoon:lasers/north/broken
execute as @e[type=marker,tag=buffoon.laser_east] at @s unless block ~ ~ ~ minecraft:lime_stained_glass run function buffoon:lasers/east/broken
execute as @e[type=marker,tag=buffoon.laser_south] at @s unless block ~ ~ ~ minecraft:light_blue_stained_glass run function buffoon:lasers/south/broken
execute as @e[type=marker,tag=buffoon.laser_west] at @s unless block ~ ~ ~ minecraft:yellow_stained_glass run function buffoon:lasers/west/broken
scoreboard players add #timer buffoon.laser 1
execute if score #timer buffoon.laser matches 2.. as @e[type=marker,tag=buffoon.laser] at @s run function buffoon:lasers/beam_start
execute if score #timer buffoon.laser matches 2.. run scoreboard players set #timer buffoon.laser 0
scoreboard players operation #active buffoon.laser = #north buffoon.laser
scoreboard players operation #active buffoon.laser += #east buffoon.laser
scoreboard players operation #active buffoon.laser += #south buffoon.laser
scoreboard players operation #active buffoon.laser += #west buffoon.laser
execute if score #active buffoon.laser matches 4 unless score #fired buffoon.laser matches 1 run function buffoon:lasers/all_active
execute if score #state buffoon.laser matches 1 run function buffoon:lasers/mining/tick
execute if score #fired buffoon.laser matches 1 if score #active buffoon.laser matches 0 run function buffoon:lasers/reset
