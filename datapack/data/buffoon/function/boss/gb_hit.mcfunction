tag @s add buffoon.gb_hit
function buffoon:boss/hurt {a:9}
effect give @s minecraft:slowness 3 1 true
particle minecraft:splash ~ ~1 ~ 0.4 0.6 0.4 0 30 force @a
playsound minecraft:entity.player.splash.high_speed player @s ~ ~ ~ 1 0.9
