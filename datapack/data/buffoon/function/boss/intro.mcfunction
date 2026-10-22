scoreboard players set #state buffoon.boss 1
scoreboard players set #bt buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_center] run playsound minecraft:music.dragon record @a[distance=..150] ~ ~ ~ 1000 1
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] times 10 70 20
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] title {text:"The Final Planet",color:"#B48CFF",bold:true}
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] subtitle {text:"Something waits among the stars...",color:"gray",italic:true}
