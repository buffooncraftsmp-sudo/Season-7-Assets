scoreboard players add #nt buffoon.nexus 1
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run effect give @a[distance=..64] minecraft:darkness 22 0 true
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.warden.emerge master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:ambient.cave master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] times 10 60 20
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] title {text:"Something stirs...",color:"dark_purple",italic:true}
execute if score #nt buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] subtitle {text:"The four stones are awakening",color:"gray"}
execute if score #nt buffoon.nexus matches 60 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.wither.ambient master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 60 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:block.trial_spawner.ominous_activate master @a[distance=..96] ~ ~ ~ 4 0.6
execute if score #nt buffoon.nexus matches 100 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:event.mob_effect.bad_omen master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 100 at @n[type=marker,tag=buffoon.nexus] run effect give @a[distance=..64] minecraft:nausea 8 0 true
execute if score #nt buffoon.nexus matches 140 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:block.sculk_shrieker.shriek master @a[distance=..96] ~ ~ ~ 4 0.6
execute if score #nt buffoon.nexus matches 140 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 200 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.warden.roar master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 200 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] times 0 40 10
execute if score #nt buffoon.nexus matches 200 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] title {text:"THE STARS ARE WATCHING",color:"dark_red",bold:true,obfuscated:true}
execute if score #nt buffoon.nexus matches 200 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] subtitle {text:"do not look away",color:"dark_red",italic:true}
execute if score #nt buffoon.nexus matches 260 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.wither.spawn master @a[distance=..96] ~ ~ ~ 4 0.5
execute if score #nt buffoon.nexus matches 340 at @n[type=marker,tag=buffoon.nexus] run stopsound @a[distance=..96]
execute if score #nt buffoon.nexus matches 340 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] times 0 30 0
execute if score #nt buffoon.nexus matches 340 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] title {text:"...",color:"dark_gray"}
execute if score #nt buffoon.nexus matches 340 at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] subtitle {text:""}
execute if score #nt buffoon.nexus matches 380 at @n[type=marker,tag=buffoon.nexus] run function buffoon:nexus/finale
scoreboard players operation #m buffoon.nexus = #nt buffoon.nexus
scoreboard players operation #m buffoon.nexus %= #20 buffoon.nexus
execute if score #nt buffoon.nexus matches ..199 if score #m buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.warden.heartbeat master @a[distance=..96] ~ ~ ~ 4 0.6
scoreboard players operation #m buffoon.nexus = #nt buffoon.nexus
scoreboard players operation #m buffoon.nexus %= #8 buffoon.nexus
execute if score #nt buffoon.nexus matches 200..339 if score #m buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.warden.heartbeat master @a[distance=..96] ~ ~ ~ 6 0.8
execute if score #nt buffoon.nexus matches ..339 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:reverse_portal ~ ~1 ~ 4 2 4 0.4 40 force @a
execute if score #nt buffoon.nexus matches ..339 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:sculk_soul ~ ~0.5 ~ 3 0.5 3 0.03 6 force @a
execute if score #nt buffoon.nexus matches ..339 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:soul ~ ~ ~ 6 0.2 6 0.02 6 force @a
execute if score #nt buffoon.nexus matches 100..339 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:squid_ink ~ ~2 ~ 2 2 2 0.05 8 force @a
execute if score #nt buffoon.nexus matches 200..339 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:portal ~ ~1.5 ~ 1 1 1 2 80 force @a
scoreboard players operation #m buffoon.nexus = #nt buffoon.nexus
scoreboard players operation #m buffoon.nexus %= #30 buffoon.nexus
execute if score #nt buffoon.nexus matches 200..339 if score #m buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:sonic_boom ~ ~1.5 ~ 0 0 0 0 1 force @a
execute if score #nt buffoon.nexus matches 200..339 if score #m buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run playsound minecraft:entity.warden.sonic_boom master @a[distance=..96] ~ ~ ~ 3 0.5
execute if score #nt buffoon.nexus matches ..339 at @n[type=marker,tag=buffoon.nexus] run function buffoon:nexus/streams {s:"1.5"}
