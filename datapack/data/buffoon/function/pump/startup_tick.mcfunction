execute if score #count buffoon.pump matches ..2 run return run function buffoon:pump/startup_paused
execute if score #paused buffoon.pump matches 1 run bossbar set buffoon:pump name {text:"Pump starting up...",color:"gold"}
execute if score #paused buffoon.pump matches 1 run bossbar set buffoon:pump color yellow
scoreboard players set #paused buffoon.pump 0
scoreboard players remove #su buffoon.pump 1
execute store result bossbar buffoon:pump value run scoreboard players get #su buffoon.pump
scoreboard players operation #m buffoon.pump = #su buffoon.pump
scoreboard players operation #m buffoon.pump %= #10 buffoon.pump
execute if score #m buffoon.pump matches 0 at @n[type=marker,tag=buffoon.pump_nozzle] run function buffoon:pump/startup_sound
execute if score #su buffoon.pump matches ..0 run function buffoon:pump/startup_done
