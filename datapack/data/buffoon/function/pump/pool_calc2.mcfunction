execute store result score #cx buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_top] Pos[0]
execute store result score #cz buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_top] Pos[2]
execute store result score #top buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_top] Pos[1]
execute store result score #bot buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_bottom] Pos[1]
execute if score #bot buffoon.pump > #top buffoon.pump run tellraw @s {text:"Bottom is above the top - swap them round.",color:"red"}
execute if score #bot buffoon.pump > #top buffoon.pump run return 0
scoreboard players operation #x1 buffoon.pump = #cx buffoon.pump
scoreboard players remove #x1 buffoon.pump 20
scoreboard players operation #x2 buffoon.pump = #cx buffoon.pump
scoreboard players add #x2 buffoon.pump 20
scoreboard players operation #z1 buffoon.pump = #cz buffoon.pump
scoreboard players remove #z1 buffoon.pump 20
scoreboard players operation #z2 buffoon.pump = #cz buffoon.pump
scoreboard players add #z2 buffoon.pump 20
scoreboard players operation #n buffoon.pump = #top buffoon.pump
scoreboard players operation #n buffoon.pump -= #bot buffoon.pump
scoreboard players add #n buffoon.pump 1
scoreboard players operation #cy buffoon.pump = #top buffoon.pump
scoreboard players add #cy buffoon.pump 1
scoreboard players operation #layer buffoon.pump = #top buffoon.pump
execute store result storage buffoon:pump pool.cx int 1 run scoreboard players get #cx buffoon.pump
execute store result storage buffoon:pump pool.cz int 1 run scoreboard players get #cz buffoon.pump
execute store result storage buffoon:pump pool.cy int 1 run scoreboard players get #cy buffoon.pump
execute store result storage buffoon:pump pool.top int 1 run scoreboard players get #top buffoon.pump
execute store result storage buffoon:pump pool.bot int 1 run scoreboard players get #bot buffoon.pump
execute store result storage buffoon:pump pool.n int 1 run scoreboard players get #n buffoon.pump
execute store result storage buffoon:pump pool.x1 int 1 run scoreboard players get #x1 buffoon.pump
execute store result storage buffoon:pump pool.x2 int 1 run scoreboard players get #x2 buffoon.pump
execute store result storage buffoon:pump pool.z1 int 1 run scoreboard players get #z1 buffoon.pump
execute store result storage buffoon:pump pool.z2 int 1 run scoreboard players get #z2 buffoon.pump
execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #layer buffoon.pump
function buffoon:pump/pool_setup2 with storage buffoon:pump pool
