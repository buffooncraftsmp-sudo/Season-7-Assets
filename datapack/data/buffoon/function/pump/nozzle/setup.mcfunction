kill @e[type=marker,tag=buffoon.pump_nozzle]
summon marker ~ ~ ~ {Tags:["buffoon.pump_nozzle"]}
forceload add ~ ~
tellraw @s {text:"Pump nozzle set here.",color:"#D8D040"}
