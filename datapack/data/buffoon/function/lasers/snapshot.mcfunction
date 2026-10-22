execute at @n[type=marker,tag=buffoon.laser_origin] store success score #backup buffoon.laser run clone ~-5 ~-6 ~-5 ~5 ~1 ~5 5000 200 5000 replace force
execute if score #backup buffoon.laser matches 1 at @n[type=marker,tag=buffoon.laser_origin] run function buffoon:lasers/core_stone_place
execute if score #backup buffoon.laser matches 1 run tellraw @a[gamemode=creative] {text:"Dig site saved. Breaking all four lenses will restore it.",color:"gold"}
execute unless score #backup buffoon.laser matches 1 run tellraw @a[gamemode=creative] {text:"Dig site save FAILED - stand at the target and run set_core again.",color:"red"}
