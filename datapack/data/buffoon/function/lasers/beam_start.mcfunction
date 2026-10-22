scoreboard players set @s buffoon.ray 0
execute facing entity @n[type=marker,tag=buffoon.laser_core] feet positioned ^ ^ ^0.6 run function buffoon:lasers/beam_step with entity @s data
