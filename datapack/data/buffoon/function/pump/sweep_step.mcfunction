execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #sy buffoon.pump
function buffoon:pump/sweep_layer with storage buffoon:pump pool
scoreboard players add #sy buffoon.pump 1
execute if score #sy buffoon.pump <= #wmaxy buffoon.pump run function buffoon:pump/sweep_step
