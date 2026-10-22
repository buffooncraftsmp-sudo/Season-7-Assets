# Full reset: pull installed parts, wipe stray copies, refill the hiding barrels, restore the target spot
execute if score #core buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_core] at @s run function buffoon:ufo/core/remove
execute if score #nav buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_nav] at @s run function buffoon:ufo/nav/remove
execute if score #panel buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_panel] at @s run function buffoon:ufo/panel/remove
execute as @e[type=marker,tag=buffoon.ufo_slot_core] at @s run function buffoon:ufo/core/holo_show
execute as @e[type=marker,tag=buffoon.ufo_slot_nav] at @s run function buffoon:ufo/nav/holo_show
execute as @e[type=marker,tag=buffoon.ufo_slot_panel] at @s run function buffoon:ufo/panel/holo_show
clear @a minecraft:beacon[minecraft:custom_data~{buffoon_ufo:"core"}]
clear @a minecraft:cartography_table[minecraft:custom_data~{buffoon_ufo:"nav"}]
clear @a minecraft:comparator[minecraft:custom_data~{buffoon_ufo:"panel"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_ufo:"core"}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_ufo:"nav"}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_ufo:"panel"}}}}]
function buffoon:ufo/refill/core
function buffoon:ufo/refill/nav
function buffoon:ufo/refill/panel
scoreboard players set #state buffoon.ufo 0
scoreboard players set #count buffoon.ufo 0
bossbar remove buffoon:ufo
execute if score #backup buffoon.ufo matches 1 at @n[type=marker,tag=buffoon.ufo_target_origin] run clone 5000 200 5000 5004 204 5004 ~-2 ~-1 ~-2 replace force
execute at @n[type=marker,tag=buffoon.ufo_target_origin] run kill @e[type=item,distance=..5]
execute at @n[type=marker,tag=buffoon.ufo_target_origin] run tp @n[type=marker,tag=buffoon.ufo_target] ~ ~ ~
execute at @n[type=marker,tag=buffoon.ufo_emitter] run particle minecraft:reverse_portal ~ ~ ~ 3 2 3 0.05 300 force @a
tellraw @a [{text:"🛸 ",color:"#7CFF4F"},{text:"The UFO has powered down. ",color:"#7CFF4F",bold:true},{text:"Its missing parts are hidden once more - the aliens await new rescuers.",color:"green"}]
