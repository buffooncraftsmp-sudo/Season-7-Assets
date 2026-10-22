kill @e[type=marker,tag=buffoon.pump_barrel_valve]
summon marker ~ ~ ~ {Tags:["buffoon.pump_barrel","buffoon.pump_barrel_valve"]}
forceload add ~ ~
function buffoon:pump/refill/valve
tellraw @s {text:"Pressure Valve will be hidden in this barrel (filled now and on every reset).",color:"#D8D040"}
scoreboard players set @s buffoon.ray 100
