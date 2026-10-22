# Full reset: pull all placed lenses, restore the dig site, return the drill point, re-arm the sequence
execute if entity @e[type=marker,tag=buffoon.laser_north] if entity @s[type=player] run function buffoon:lasers/give/north
execute if entity @e[type=marker,tag=buffoon.laser_east] if entity @s[type=player] run function buffoon:lasers/give/east
execute if entity @e[type=marker,tag=buffoon.laser_south] if entity @s[type=player] run function buffoon:lasers/give/south
execute if entity @e[type=marker,tag=buffoon.laser_west] if entity @s[type=player] run function buffoon:lasers/give/west
execute as @e[type=marker,tag=buffoon.laser_north] at @s run function buffoon:lasers/north/remove
execute as @e[type=marker,tag=buffoon.laser_east] at @s run function buffoon:lasers/east/remove
execute as @e[type=marker,tag=buffoon.laser_south] at @s run function buffoon:lasers/south/remove
execute as @e[type=marker,tag=buffoon.laser_west] at @s run function buffoon:lasers/west/remove
scoreboard players set #fired buffoon.laser 0
scoreboard players set #state buffoon.laser 0
scoreboard players set #mine buffoon.laser 0
bossbar remove buffoon:mining
execute if score #backup buffoon.laser matches 1 at @n[type=marker,tag=buffoon.laser_origin] run clone 5000 200 5000 5010 207 5010 ~-5 ~-6 ~-5 replace force
execute at @n[type=marker,tag=buffoon.laser_origin] run kill @e[type=item,distance=..10]
execute at @n[type=marker,tag=buffoon.laser_origin] run tp @n[type=marker,tag=buffoon.laser_core] ~ ~ ~
execute at @n[type=marker,tag=buffoon.laser_origin] run function buffoon:lasers/core_stone_place
execute at @n[type=marker,tag=buffoon.laser_origin] run particle minecraft:reverse_portal ~ ~-2 ~ 4 2 4 0.05 400 force @a
execute at @n[type=marker,tag=buffoon.laser_origin] run playsound minecraft:block.respawn_anchor.set_spawn master @a[distance=..300] ~ ~ ~ 4 0.6
tellraw @a [{text:"☄ ",color:"gold"},{text:"The comet has sealed itself once more. ",color:"gold",bold:true},{text:"The mining lasers stand primed for the next expedition.",color:"yellow"}]
execute at @n[type=marker,tag=buffoon.laser_origin] run title @a[distance=..300] actionbar {text:"☄ Comet reformed - lasers primed and ready ☄",color:"gold"}
