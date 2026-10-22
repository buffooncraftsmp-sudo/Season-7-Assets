scoreboard players set #dt buffoon.pump 0
execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #layer buffoon.pump
scoreboard players operation #l1 buffoon.pump = #layer buffoon.pump
scoreboard players add #l1 buffoon.pump 1
scoreboard players operation #l2 buffoon.pump = #layer buffoon.pump
scoreboard players add #l2 buffoon.pump 2
execute store result storage buffoon:pump pool.l1 int 1 run scoreboard players get #l1 buffoon.pump
execute store result storage buffoon:pump pool.l2 int 1 run scoreboard players get #l2 buffoon.pump
function buffoon:pump/drain_do with storage buffoon:pump pool
execute at @n[type=marker,tag=buffoon.pump_center] run playsound minecraft:entity.player.splash.high_speed master @a[distance=..200] ~ ~ ~ 4 0.6
scoreboard players remove #layer buffoon.pump 1
scoreboard players operation #left buffoon.pump = #layer buffoon.pump
scoreboard players operation #left buffoon.pump -= #bot buffoon.pump
scoreboard players add #left buffoon.pump 1
execute store result bossbar buffoon:pump value run scoreboard players get #left buffoon.pump
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.piston.contract master @a[distance=..200] ~ ~ ~ 6 0.5
execute if score #layer buffoon.pump < #bot buffoon.pump run function buffoon:pump/drained
