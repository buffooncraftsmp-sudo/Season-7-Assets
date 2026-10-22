execute if block ~ ~ ~ minecraft:waxed_lightning_rod align xyz positioned ~0.5 ~0.5 ~0.5 run return run function buffoon:pump/nozzle/setup
scoreboard players add @s buffoon.ray 1
execute if score @s buffoon.ray matches ..70 positioned ^ ^ ^0.1 run function buffoon:pump/nozzle/ray
