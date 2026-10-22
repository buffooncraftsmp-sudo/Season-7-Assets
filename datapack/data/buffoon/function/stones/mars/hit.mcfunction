scoreboard players set #creative buffoon.ray 0
execute store success score #creative buffoon.ray on attacker if entity @s[gamemode=creative]
data remove entity @s attack
execute if score #creative buffoon.ray matches 1 as @n[type=marker,tag=buffoon.stone_mars,distance=..1.5] at @s run function buffoon:stones/mars/broken
