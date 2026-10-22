scoreboard players set @s buffoon.ray 0
execute facing entity @n[type=marker,tag=buffoon.ufo_target] feet positioned ^ ^ ^0.6 run function buffoon:ufo/beam_step
