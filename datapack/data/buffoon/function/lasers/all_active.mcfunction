scoreboard players set #fired buffoon.laser 1
scoreboard players set #state buffoon.laser 1
scoreboard players set #mine buffoon.laser 2400
bossbar add buffoon:mining {text:"Mining the Comet Core",color:"gold"}
bossbar set buffoon:mining max 2400
bossbar set buffoon:mining color yellow
bossbar set buffoon:mining style notched_10
execute at @n[type=marker,tag=buffoon.laser_core] run bossbar set buffoon:mining players @a[distance=..300]
execute at @n[type=marker,tag=buffoon.laser_core] run playsound minecraft:block.beacon.activate master @a[distance=..300] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.laser_core] run playsound minecraft:entity.warden.sonic_charge master @a[distance=..300] ~ ~ ~ 100 0.6
execute at @n[type=marker,tag=buffoon.laser_core] run title @a[distance=..300] title {text:"Mining Laser Engaged",color:"gold",bold:true}
execute at @n[type=marker,tag=buffoon.laser_core] run title @a[distance=..300] subtitle {text:"Extracting the comet core...",color:"yellow"}
