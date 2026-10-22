fill ~-4 ~-1 ~-3 ~4 ~-1 ~3 minecraft:air replace
fill ~-3 ~-1 ~-4 ~3 ~-1 ~4 minecraft:air replace
particle minecraft:explosion_emitter ~ ~-1 ~ 0 0 0 0 1 force @a
particle minecraft:block{block_state:{Name:"minecraft:blackstone"}} ~ ~-1 ~ 3 0.4 3 0 300 force @a
particle minecraft:large_smoke ~ ~ ~ 3 1 3 0.05 80 force @a
playsound minecraft:entity.generic.explode block @a[distance=..300] ~ ~ ~ 6 0.6
playsound minecraft:block.anvil.land block @a[distance=..300] ~ ~ ~ 3 0.5
tp @s ~ ~-1 ~
