$scoreboard players add #$(id).cur buffoon.water 1
$data modify storage buffoon:water step set from storage buffoon:water areas.$(id)
$execute store result storage buffoon:water step.y int 1 run scoreboard players get #$(id).cur buffoon.water
function buffoon:water/layer_fill with storage buffoon:water step
function buffoon:water/sound_rise with storage buffoon:water step
