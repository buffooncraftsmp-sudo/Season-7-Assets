# Stand in the block space where the Suction Filter should be placed
execute as @e[type=marker,tag=buffoon.pump_slot_filter] at @s run function buffoon:pump/filter/holo_hide
kill @e[type=marker,tag=buffoon.pump_slot_filter]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.pump_slot","buffoon.pump_slot_filter"]}
forceload add ~ ~
scoreboard players set #filter buffoon.pump 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:pump/filter/holo_show
tellraw @s {text:"Suction Filter slot set here.",color:"#D8D040"}
