scoreboard players set #state buffoon.pump 1
scoreboard players operation #layer buffoon.pump = #top buffoon.pump
scoreboard players set #dt buffoon.pump 0
scoreboard players operation #total buffoon.pump = #n buffoon.pump
bossbar add buffoon:pump {text:"Draining the toxic pool",color:"yellow"}
execute store result bossbar buffoon:pump max run scoreboard players get #total buffoon.pump
execute store result bossbar buffoon:pump value run scoreboard players get #total buffoon.pump
bossbar set buffoon:pump color yellow
bossbar set buffoon:pump style notched_6
execute at @n[type=marker,tag=buffoon.pump_nozzle] run bossbar set buffoon:pump players @a[distance=..200]
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.piston.extend master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.bubble_column.whirlpool_inside master @a[distance=..200] ~ ~ ~ 100 0.6
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:splash ~ ~ ~ 4 1 4 0 800 force @a
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:bubble_pop ~ ~ ~ 4 0.5 4 0.1 200 force @a
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:falling_water ~ ~3 ~ 4 2 4 0 200 force @a
execute at @n[type=marker,tag=buffoon.pump_center] run playsound minecraft:entity.player.splash.high_speed master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_center] run playsound minecraft:entity.generic.splash master @a[distance=..200] ~ ~ ~ 100 0.6
execute at @n[type=marker,tag=buffoon.pump_center] run playsound minecraft:item.bucket.empty master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_nozzle] run function buffoon:pump/geyser
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] title {text:"SPLOOSH!",color:"#D8D040",bold:true}
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] subtitle {text:"The pump is sucking up the toxic water...",color:"yellow"}
