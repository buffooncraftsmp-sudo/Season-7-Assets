kill @e[type=marker,tag=buffoon.pump_barrel_filter]
summon marker ~ ~ ~ {Tags:["buffoon.pump_barrel","buffoon.pump_barrel_filter"]}
forceload add ~ ~
function buffoon:pump/refill/filter
tellraw @s {text:"Suction Filter will be hidden in this barrel (filled now and on every reset).",color:"#D8D040"}
scoreboard players set @s buffoon.ray 100
