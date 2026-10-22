kill @e[type=block_display,tag=buffoon.meteor_vis,distance=..2]
particle minecraft:explosion_emitter ~ ~0.5 ~ 0 0 0 0 1 force @a
particle minecraft:flame ~ ~0.4 ~ 1.2 0.4 1.2 0.12 30 force @a
particle minecraft:lava ~ ~0.5 ~ 1 0.3 1 0 8 force @a
particle minecraft:large_smoke ~ ~0.8 ~ 1 0.6 1 0.03 15 force @a
playsound minecraft:entity.generic.explode hostile @a[distance=..60] ~ ~ ~ 2 1.1
execute as @a[distance=..2.5,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/hurt {a:12}
execute as @a[distance=2.5..4,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/hurt {a:6}
effect give @a[distance=..2.5,gamemode=!spectator,gamemode=!creative] minecraft:levitation 1 3 true
kill @s
