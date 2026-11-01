execute store result storage buffoon:event tmp.z.y int 1 run scoreboard players get #y buffoon.event
function buffoon:event/op/copy_layer with storage buffoon:event tmp.z
scoreboard players add #y buffoon.event 1
execute if score #y buffoon.event <= #y2 buffoon.event run function buffoon:event/op/copy_loop
