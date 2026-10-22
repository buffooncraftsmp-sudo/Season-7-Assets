advancement revoke @s only buffoon:ufo/place_emitter
scoreboard players set @s buffoon.ray 0
execute at @s anchored eyes positioned ^ ^ ^ run function buffoon:ufo/emitter/ray
