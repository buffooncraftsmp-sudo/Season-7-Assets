$data modify storage buffoon:water step set from storage buffoon:water areas.$(id)
$execute store result storage buffoon:water step.y int 1 run scoreboard players get #$(id).cur buffoon.water
function buffoon:water/layer_drain with storage buffoon:water step
function buffoon:water/sound_fall with storage buffoon:water step
$scoreboard players remove #$(id).cur buffoon.water 1
