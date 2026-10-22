particle minecraft:portal ~ ~1.2 ~ 0.6 1.2 0.6 0.6 12 force @a
particle minecraft:reverse_portal ~ ~1.5 ~ 0.4 1.4 0.4 0.02 6 force @a
particle minecraft:end_rod ~ ~0.2 ~ 0.8 0 0.8 0.01 2 force @a
execute as @a[distance=..1.6] run function buffoon:boss/send_home
