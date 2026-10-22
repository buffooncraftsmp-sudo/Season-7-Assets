$execute as @a[distance=$(r0)..$(r1),tag=!buffoon.wave_hit,gamemode=!spectator,gamemode=!creative] at @s unless block ~ ~-0.3 ~ minecraft:air run function buffoon:boss/wave_hit
