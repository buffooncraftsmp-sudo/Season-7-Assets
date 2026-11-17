execute if score #state buffoon.elder matches 1 run function buffoon:elder/fight_tick
# tidy up anything left over from a reset or win once its chunk is loaded again
execute unless score #state buffoon.elder matches 1 if entity @e[tag=buffoon.elder_mob,limit=1] run function buffoon:elder/despawn_mobs
execute as @e[type=marker,tag=buffoon.elder_clear] at @s run function buffoon:elder/clear_chest
