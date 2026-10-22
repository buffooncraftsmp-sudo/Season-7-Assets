execute if entity @s[tag=buffoon.meteor_launch] run function buffoon:boss/meteor_launch
scoreboard players add @s buffoon.boss 1
execute if score @s buffoon.boss matches 30.. run kill @s
