execute if score #count buffoon.pump matches ..2 run return run function buffoon:pump/paused
execute if score #paused buffoon.pump matches 1 run bossbar set buffoon:pump name {text:"Draining the toxic pool",color:"yellow"}
execute if score #paused buffoon.pump matches 1 run bossbar set buffoon:pump color yellow
scoreboard players set #paused buffoon.pump 0
scoreboard players remove #phase buffoon.pump 1
execute if score #phase buffoon.pump matches ..0 run scoreboard players set #phase buffoon.pump 6
execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #layer buffoon.pump
function buffoon:pump/beam_start with storage buffoon:pump pool
function buffoon:pump/surface_fx with storage buffoon:pump pool
execute at @n[type=marker,tag=buffoon.pump_nozzle] run function buffoon:pump/geyser
scoreboard players add #dt buffoon.pump 1
scoreboard players operation #snd buffoon.pump = #dt buffoon.pump
scoreboard players operation #snd buffoon.pump %= #10 buffoon.pump
execute if score #snd buffoon.pump matches 0 at @n[type=marker,tag=buffoon.pump_nozzle] run function buffoon:pump/sounds
execute if score #dt buffoon.pump matches 60.. run function buffoon:pump/drain_layer
