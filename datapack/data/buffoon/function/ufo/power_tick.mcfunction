execute if score #count buffoon.ufo matches ..2 run return run function buffoon:ufo/power_paused
execute if score #paused buffoon.ufo matches 1 run bossbar set buffoon:ufo name {text:"UFO Powering Up",color:"green"}
execute if score #paused buffoon.ufo matches 1 run bossbar set buffoon:ufo color green
scoreboard players set #paused buffoon.ufo 0
scoreboard players remove #pow buffoon.ufo 1
execute store result bossbar buffoon:ufo value run scoreboard players get #pow buffoon.ufo
execute at @n[type=marker,tag=buffoon.ufo_emitter] run particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.5f} ~ ~ ~ 1.5 1.5 1.5 0 6 force @a
execute at @n[type=marker,tag=buffoon.ufo_emitter] run particle minecraft:electric_spark ~ ~ ~ 1 1 1 0.3 4 force @a
execute at @n[type=marker,tag=buffoon.ufo_emitter] run particle minecraft:happy_villager ~ ~-1 ~ 4 1 4 0 3 force @a
execute as @e[type=marker,tag=buffoon.ufo_slot] at @s run particle minecraft:electric_spark ~ ~0.6 ~ 0.3 0.3 0.3 0.2 2 force @a
scoreboard players operation #mod buffoon.ufo = #pow buffoon.ufo
scoreboard players operation #mod buffoon.ufo %= #20 buffoon.ufo
execute if score #mod buffoon.ufo matches 0 at @n[type=marker,tag=buffoon.ufo_emitter] run function buffoon:ufo/power_second
execute if score #pow buffoon.ufo matches ..0 run function buffoon:ufo/fire
