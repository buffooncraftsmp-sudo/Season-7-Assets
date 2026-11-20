# A big gush when a button starts the water moving
$execute store result storage buffoon:water snd.y int 1 run scoreboard players get #$(id).cur buffoon.water
$execute if score #$(id).cur buffoon.water < #$(id).target buffoon.water run data modify storage buffoon:water snd.dir set value "rise"
$execute if score #$(id).cur buffoon.water > #$(id).target buffoon.water run data modify storage buffoon:water snd.dir set value "fall"
$data modify storage buffoon:water snd.dim set value "$(dim)"
$data modify storage buffoon:water snd.cx set value $(cx)
$data modify storage buffoon:water snd.cz set value $(cz)
function buffoon:water/start_sound_do with storage buffoon:water snd
