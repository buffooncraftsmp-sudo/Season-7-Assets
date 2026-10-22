execute at @n[type=marker,tag=buffoon.ufo_target_origin] store success score #backup buffoon.ufo run clone ~-2 ~-1 ~-2 ~2 ~3 ~2 5000 200 5000 replace force
execute if score #backup buffoon.ufo matches 1 run tellraw @a[gamemode=creative] {text:"UFO target spot saved - resets will clear the plinth.",color:"#7CFF4F"}
execute unless score #backup buffoon.ufo matches 1 run tellraw @a[gamemode=creative] {text:"UFO target save FAILED - stand on the spot and run set_target again.",color:"red"}
