function buffoon:pump/snapshot2_loop
scoreboard players operation #backup2 buffoon.pump = #ok buffoon.pump
execute if score #backup2 buffoon.pump matches 1 run tellraw @a[gamemode=creative] {text:"Toxic pool saved - resets will refill it.",color:"#D8D040"}
execute unless score #backup2 buffoon.pump matches 1 run tellraw @a[gamemode=creative] {text:"Pool save FAILED - stand in the pool and run set_pool_top again.",color:"red"}
