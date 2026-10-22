scoreboard players set #state buffoon.laser 2
execute at @n[type=marker,tag=buffoon.laser_origin] run function buffoon:lasers/core_stone_remove
bossbar remove buffoon:mining
execute as @n[type=marker,tag=buffoon.laser_core] at @s run function buffoon:lasers/mining/build_plinth
