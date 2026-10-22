# Stand in the block space where the Pressure Valve should be placed
execute as @e[type=marker,tag=buffoon.pump_slot_valve] at @s run function buffoon:pump/valve/holo_hide
kill @e[type=marker,tag=buffoon.pump_slot_valve]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.pump_slot","buffoon.pump_slot_valve"]}
forceload add ~ ~
scoreboard players set #valve buffoon.pump 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:pump/valve/holo_show
tellraw @s {text:"Pressure Valve slot set here.",color:"#D8D040"}
