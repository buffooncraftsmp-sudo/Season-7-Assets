tag @s add buffoon.wave_hit
function buffoon:boss/hurt {a:5}
effect give @s minecraft:levitation 1 6 true
playsound minecraft:entity.player.splash.high_speed player @s ~ ~ ~ 1 0.8
particle minecraft:splash ~ ~1 ~ 0.5 0.5 0.5 0 30 force @a
