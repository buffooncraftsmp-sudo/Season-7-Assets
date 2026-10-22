scoreboard players operation #y buffoon.pump = #bot buffoon.pump
scoreboard players operation #y buffoon.pump += #i buffoon.pump
scoreboard players set #vy buffoon.pump 150
scoreboard players operation #vy buffoon.pump += #i buffoon.pump
execute store result storage buffoon:pump pool.y int 1 run scoreboard players get #y buffoon.pump
execute store result storage buffoon:pump pool.vy int 1 run scoreboard players get #vy buffoon.pump
function buffoon:pump/snapshot2_loop_do with storage buffoon:pump pool
scoreboard players add #i buffoon.pump 1
execute if score #i buffoon.pump <= #n buffoon.pump run function buffoon:pump/snapshot2_loop_step
