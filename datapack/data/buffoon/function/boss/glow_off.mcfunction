scoreboard players set #glow buffoon.boss 0
data merge entity @n[type=mannequin,tag=buffoon.boss] {Glowing:0b}
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.beacon.deactivate hostile @a[distance=..120] ~ ~ ~ 4 1.2
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.glass.break hostile @a[distance=..120] ~ ~ ~ 3 0.6
