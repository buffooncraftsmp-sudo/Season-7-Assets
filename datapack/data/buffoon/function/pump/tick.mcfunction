execute if score #motor buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_motor] at @s unless block ~ ~ ~ minecraft:blast_furnace run function buffoon:pump/motor/broken
execute if score #motor buffoon.pump matches 0 if score #t buffoon.pump matches 0 as @e[type=marker,tag=buffoon.pump_slot_motor] at @s run particle minecraft:dust{color:[0.85,0.82,0.25],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute if score #filter buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_filter] at @s unless block ~ ~ ~ minecraft:hopper run function buffoon:pump/filter/broken
execute if score #filter buffoon.pump matches 0 if score #t buffoon.pump matches 0 as @e[type=marker,tag=buffoon.pump_slot_filter] at @s run particle minecraft:dust{color:[0.85,0.82,0.25],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute if score #valve buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_valve] at @s unless block ~ ~ ~ minecraft:waxed_copper_bulb run function buffoon:pump/valve/broken
execute if score #valve buffoon.pump matches 0 if score #t buffoon.pump matches 0 as @e[type=marker,tag=buffoon.pump_slot_valve] at @s run particle minecraft:dust{color:[0.85,0.82,0.25],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute as @e[type=marker,tag=buffoon.pump_nozzle] at @s unless block ~ ~ ~ minecraft:waxed_lightning_rod run kill @s
scoreboard players add #t buffoon.pump 1
execute if score #t buffoon.pump matches 4.. run scoreboard players set #t buffoon.pump 0
execute as @e[type=item_display,tag=buffoon.pump_ghost] at @s run tp @s ~ ~ ~ ~4 ~
function buffoon:pump/count
execute if score #poolset2 buffoon.pump matches 1 if score #t buffoon.pump matches 0 run function buffoon:pump/pool_tick with storage buffoon:pump pool
execute if score #state buffoon.pump matches 0 if score #count buffoon.pump matches 3 if score #poolset2 buffoon.pump matches 1 run function buffoon:pump/startup_begin
execute if score #state buffoon.pump matches 3 run function buffoon:pump/startup_tick
execute if score #state buffoon.pump matches 1 run function buffoon:pump/pump_tick
execute if score #testbeam buffoon.pump matches 1.. run scoreboard players remove #phase buffoon.pump 1
execute if score #testbeam buffoon.pump matches 1.. if score #phase buffoon.pump matches ..0 run scoreboard players set #phase buffoon.pump 6
execute if score #testbeam buffoon.pump matches 1.. unless score #state buffoon.pump matches 1 run execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #top buffoon.pump
execute if score #testbeam buffoon.pump matches 1.. run function buffoon:pump/beam_start with storage buffoon:pump pool
execute if score #testbeam buffoon.pump matches 1.. run scoreboard players remove #testbeam buffoon.pump 1
execute if score #state buffoon.pump matches 2 run scoreboard players add #keep buffoon.pump 1
execute if score #state buffoon.pump matches 2 if score #keep buffoon.pump matches 20.. run function buffoon:pump/sweep_all
execute if score #keep buffoon.pump matches 20.. run scoreboard players set #keep buffoon.pump 0
execute if score #state buffoon.pump matches 1.. if score #count buffoon.pump matches 0 run function buffoon:pump/reset
