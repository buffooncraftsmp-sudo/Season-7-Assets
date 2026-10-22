scoreboard players set #state buffoon.ufo 2
scoreboard players set #fire buffoon.ufo 100
bossbar remove buffoon:ufo
execute at @n[type=marker,tag=buffoon.ufo_emitter] run playsound minecraft:entity.warden.sonic_boom master @a[distance=..250] ~ ~ ~ 100 0.8
execute at @n[type=marker,tag=buffoon.ufo_emitter] run playsound minecraft:entity.guardian.attack master @a[distance=..250] ~ ~ ~ 100 0.5
execute at @n[type=marker,tag=buffoon.ufo_emitter] run title @a[distance=..250] title {text:"LASER FIRING!",color:"#7CFF4F",bold:true}
execute at @n[type=marker,tag=buffoon.ufo_emitter] run title @a[distance=..250] subtitle {text:"",color:"green"}
