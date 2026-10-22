scoreboard players set #state buffoon.ufo 1
scoreboard players set #pow buffoon.ufo 1200
bossbar add buffoon:ufo {text:"UFO Powering Up",color:"green"}
bossbar set buffoon:ufo max 1200
bossbar set buffoon:ufo color green
bossbar set buffoon:ufo style notched_10
execute at @n[type=marker,tag=buffoon.ufo_emitter] run bossbar set buffoon:ufo players @a[distance=..250]
execute at @n[type=marker,tag=buffoon.ufo_emitter] run playsound minecraft:block.beacon.power_select master @a[distance=..250] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.ufo_emitter] run playsound minecraft:block.conduit.activate master @a[distance=..250] ~ ~ ~ 100 0.7
execute at @n[type=marker,tag=buffoon.ufo_emitter] run title @a[distance=..250] title {text:"Ship Repaired!",color:"#7CFF4F",bold:true}
execute at @n[type=marker,tag=buffoon.ufo_emitter] run title @a[distance=..250] subtitle {text:"The aliens are powering up the UFO...",color:"green"}
