# Look at the barrel the Suction Filter should be hidden in
scoreboard players set @s buffoon.ray 0
execute at @s anchored eyes positioned ^ ^ ^ run function buffoon:pump/set_barrel/filter_ray
