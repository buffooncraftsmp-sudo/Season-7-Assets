scoreboard players set #glow buffoon.boss 1
team join buffoon.boss @n[type=mannequin,tag=buffoon.boss]
data merge entity @n[type=mannequin,tag=buffoon.boss] {Glowing:1b}
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.beacon.activate hostile @a[distance=..120] ~ ~ ~ 4 1.6
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:block.amethyst_block.resonate hostile @a[distance=..120] ~ ~ ~ 4 0.7
