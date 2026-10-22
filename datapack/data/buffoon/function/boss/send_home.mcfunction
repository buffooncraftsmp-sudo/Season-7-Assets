particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 0.2 80 force @a
playsound minecraft:block.portal.travel player @s ~ ~ ~ 0.5 1.2
execute if data storage buffoon:boss home.x run return run function buffoon:boss/send_home_set with storage buffoon:boss home
execute in minecraft:overworld run spreadplayers 0 0 1 4 false @s
