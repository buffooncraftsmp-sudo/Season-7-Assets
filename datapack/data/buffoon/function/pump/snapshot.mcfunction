function buffoon:pump/snapshot_do with storage buffoon:pump pool
execute if score #backup buffoon.pump matches 1 run tellraw @a[gamemode=creative] {text:"Toxic pool saved - resets will refill it.",color:"#D8D040"}
execute unless score #backup buffoon.pump matches 1 run tellraw @a[gamemode=creative] {text:"Pool save FAILED (too big or not loaded) - set the corners again.",color:"red"}
