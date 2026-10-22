scoreboard players set #state buffoon.pump 3
scoreboard players set #su buffoon.pump 1800
bossbar remove buffoon:pump
bossbar add buffoon:pump {text:"Pump starting up...",color:"gold"}
bossbar set buffoon:pump max 1800
bossbar set buffoon:pump value 1800
bossbar set buffoon:pump color yellow
bossbar set buffoon:pump style notched_10
execute at @n[type=marker,tag=buffoon.pump_nozzle] run bossbar set buffoon:pump players @a[distance=..200]
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.iron_door.close master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.copper_bulb.turn_on master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.beacon.power_select master @a[distance=..200] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] title {text:"Pump Repaired!",color:"#D8D040",bold:true}
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] subtitle {text:"Starting up - get to the pool! Draining in 90 seconds",color:"yellow"}
