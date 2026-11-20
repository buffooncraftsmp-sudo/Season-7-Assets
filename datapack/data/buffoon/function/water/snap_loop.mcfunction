execute if score #y buffoon.water > #top buffoon.water run return 0
execute store result storage buffoon:water step.y int 1 run scoreboard players get #y buffoon.water
execute if score #y buffoon.water <= #L buffoon.water run function buffoon:water/layer_fill with storage buffoon:water step
execute if score #y buffoon.water > #L buffoon.water run function buffoon:water/layer_drain with storage buffoon:water step
scoreboard players add #y buffoon.water 1
function buffoon:water/snap_loop
