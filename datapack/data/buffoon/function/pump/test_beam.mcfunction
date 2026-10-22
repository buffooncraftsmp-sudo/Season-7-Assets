# Shows the suction beam for 10 seconds without running the event, and checks the setup
execute unless entity @e[type=marker,tag=buffoon.pump_nozzle] run tellraw @s {text:"✖ No Pump Nozzle found - give yourself a new one (buffoon:pump/give/nozzle) and place it again.",color:"red"}
execute if entity @e[type=marker,tag=buffoon.pump_nozzle] run tellraw @s {text:"✔ Pump Nozzle found.",color:"green"}
execute unless score #poolset2 buffoon.pump matches 1 run tellraw @s {text:"✖ Pool not set - run set_pool_top and set_pool_bottom.",color:"red"}
execute if score #poolset2 buffoon.pump matches 1 run tellraw @s {text:"✔ Pool is set.",color:"green"}
scoreboard players set #testbeam buffoon.pump 200
tellraw @s {text:"Showing the suction beam for 10 seconds...",color:"#D8D040"}
