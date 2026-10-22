# Stand in the block space where the Pump Motor should be placed
execute as @e[type=marker,tag=buffoon.pump_slot_motor] at @s run function buffoon:pump/motor/holo_hide
kill @e[type=marker,tag=buffoon.pump_slot_motor]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.pump_slot","buffoon.pump_slot_motor"]}
forceload add ~ ~
scoreboard players set #motor buffoon.pump 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:pump/motor/holo_show
tellraw @s {text:"Pump Motor slot set here.",color:"#D8D040"}
