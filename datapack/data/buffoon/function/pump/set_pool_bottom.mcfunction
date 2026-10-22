# Stand in the lowest layer of water (on the pool floor) - any spot
kill @e[type=marker,tag=buffoon.pump_bottom]
execute align xyz run summon marker ~ ~ ~ {Tags:["buffoon.pump_bottom"]}
tellraw @s {text:"Pool bottom set.",color:"#D8D040"}
execute if entity @e[type=marker,tag=buffoon.pump_top] run function buffoon:pump/pool_calc2
