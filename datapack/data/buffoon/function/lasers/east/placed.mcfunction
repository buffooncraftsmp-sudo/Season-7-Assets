advancement revoke @s only buffoon:lasers/place_east
scoreboard players set @s buffoon.ray 0
execute at @s anchored eyes positioned ^ ^ ^ run function buffoon:lasers/east/ray
