playsound minecraft:block.bubble_column.upwards_inside master @a[distance=..200] ~ ~ ~ 4 0.8
execute if score #dt buffoon.pump matches 0..15 run playsound minecraft:block.bubble_column.whirlpool_inside master @a[distance=..200] ~ ~ ~ 5 0.7
execute if score #dt buffoon.pump matches 10..25 run playsound minecraft:entity.generic.splash master @a[distance=..200] ~ ~ ~ 4 0.8
execute if score #dt buffoon.pump matches 20..35 run playsound minecraft:item.bucket.fill master @a[distance=..200] ~ ~ ~ 4 0.6
execute if score #dt buffoon.pump matches 30..45 run playsound minecraft:block.piston.extend master @a[distance=..200] ~ ~ ~ 3 0.5
execute if score #dt buffoon.pump matches 40..55 run playsound minecraft:entity.dolphin.splash master @a[distance=..200] ~ ~ ~ 4 0.7
execute if score #dt buffoon.pump matches 50.. run playsound minecraft:block.piston.contract master @a[distance=..200] ~ ~ ~ 3 0.5
playsound minecraft:block.pointed_dripstone.drip_water master @a[distance=..200] ~ ~ ~ 3 1
playsound minecraft:block.beacon.ambient master @a[distance=..200] ~ ~ ~ 3 0.5
execute at @n[type=marker,tag=buffoon.pump_center] run playsound minecraft:block.water.ambient master @a[distance=..200] ~ ~ ~ 4 0.6
