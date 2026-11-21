$execute as @e[type=drowned,tag=buffoon.twin_new_$(side)] at @s run function buffoon:twins/adopt with storage buffoon:twins sides.$(side)
$execute if score #$(side) buffoon.twins matches 1 run function buffoon:twins/fight_tick {side:"$(side)"}
# tidy up anything left over from a reset or win once its chunk is loaded again
$execute unless score #$(side) buffoon.twins matches 1 if entity @e[tag=buffoon.twin_mob_$(side),limit=1] run function buffoon:twins/despawn_mobs {side:"$(side)"}
$execute unless score #$(side) buffoon.twins matches 2 run kill @e[type=item,tag=buffoon.twin_drop_$(side)]
