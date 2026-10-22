# Stand IN the top layer of water, at the centre of the pool
kill @e[type=marker,tag=buffoon.pump_top]
execute align xyz run summon marker ~ ~ ~ {Tags:["buffoon.pump_top"]}
tellraw @s {text:"Pool top/centre set. Clearing radius is 20 blocks around here.",color:"#D8D040"}
execute if entity @e[type=marker,tag=buffoon.pump_bottom] run function buffoon:pump/pool_calc2
