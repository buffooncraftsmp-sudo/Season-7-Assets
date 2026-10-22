# Full reset: pull parts, wipe stray copies, refill part barrels, refill the pool and the pool barrel
execute if score #motor buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_motor] at @s run function buffoon:pump/motor/remove
execute if score #filter buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_filter] at @s run function buffoon:pump/filter/remove
execute if score #valve buffoon.pump matches 1 as @e[type=marker,tag=buffoon.pump_slot_valve] at @s run function buffoon:pump/valve/remove
execute as @e[type=marker,tag=buffoon.pump_slot_motor] at @s run function buffoon:pump/motor/holo_show
execute as @e[type=marker,tag=buffoon.pump_slot_filter] at @s run function buffoon:pump/filter/holo_show
execute as @e[type=marker,tag=buffoon.pump_slot_valve] at @s run function buffoon:pump/valve/holo_show
clear @a minecraft:blast_furnace[minecraft:custom_data~{buffoon_pump:"motor"}]
clear @a minecraft:hopper[minecraft:custom_data~{buffoon_pump:"filter"}]
clear @a minecraft:waxed_copper_bulb[minecraft:custom_data~{buffoon_pump:"valve"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_pump:"motor"}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_pump:"filter"}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{buffoon_pump:"valve"}}}}]
function buffoon:pump/refill/motor
function buffoon:pump/refill/filter
function buffoon:pump/refill/valve
# keep the pool barrel itself safe while the pool is restored
execute at @n[type=marker,tag=buffoon.pump_pool_barrel] if block ~ ~ ~ minecraft:barrel run clone ~ ~ ~ ~ ~ ~ 5100 150 5100 replace force
execute if score #backup2 buffoon.pump matches 1 run function buffoon:pump/refill_all
execute at @n[type=marker,tag=buffoon.pump_pool_barrel] if block 5100 150 5100 minecraft:barrel run clone 5100 150 5100 5100 150 5100 ~ ~ ~ replace force
execute at @n[type=marker,tag=buffoon.pump_pool_barrel] unless block ~ ~ ~ minecraft:barrel run setblock ~ ~ ~ minecraft:barrel[facing=up]
function buffoon:pump/refill_pool_barrel
scoreboard players set #state buffoon.pump 0
scoreboard players set #count buffoon.pump 0
scoreboard players operation #layer buffoon.pump = #top buffoon.pump
bossbar remove buffoon:pump
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:reverse_portal ~ ~ ~ 4 2 4 0.05 300 force @a
tellraw @a [{text:"☣ ",color:"#D8D040"},{text:"The toxic pool bubbles back to the brim. ",color:"#D8D040",bold:true},{text:"The pump lies broken, its parts hidden once more.",color:"yellow"}]
