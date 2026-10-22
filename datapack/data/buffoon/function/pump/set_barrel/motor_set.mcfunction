kill @e[type=marker,tag=buffoon.pump_barrel_motor]
summon marker ~ ~ ~ {Tags:["buffoon.pump_barrel","buffoon.pump_barrel_motor"]}
forceload add ~ ~
function buffoon:pump/refill/motor
tellraw @s {text:"Pump Motor will be hidden in this barrel (filled now and on every reset).",color:"#D8D040"}
scoreboard players set @s buffoon.ray 100
