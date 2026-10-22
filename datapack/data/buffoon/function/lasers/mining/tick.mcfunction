execute if score #active buffoon.laser matches ..3 run return run function buffoon:lasers/mining/paused
scoreboard players remove #mine buffoon.laser 1
execute store result bossbar buffoon:mining value run scoreboard players get #mine buffoon.laser
execute as @n[type=marker,tag=buffoon.laser_core] at @s run function buffoon:lasers/mining/fx
scoreboard players operation #mod buffoon.laser = #mine buffoon.laser
scoreboard players operation #mod buffoon.laser %= #20 buffoon.laser
execute if score #mod buffoon.laser matches 0 as @n[type=marker,tag=buffoon.laser_core] at @s run function buffoon:lasers/mining/second
scoreboard players operation #mod buffoon.laser = #mine buffoon.laser
scoreboard players operation #mod buffoon.laser %= #480 buffoon.laser
execute if score #mod buffoon.laser matches 0 as @n[type=marker,tag=buffoon.laser_core] at @s run function buffoon:lasers/mining/layer
execute if score #mine buffoon.laser matches ..0 run function buffoon:lasers/mining/reveal
