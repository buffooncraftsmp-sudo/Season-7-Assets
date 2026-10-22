scoreboard players add @s buffoon.boss 1
execute if score @s buffoon.boss matches ..34 run particle minecraft:dust{color:[1.0,0.55,0.1],scale:1.0f} ~ ~0.1 ~ 0.7 0 0.7 0 5 force @a
execute if score @s buffoon.boss matches ..34 run particle minecraft:wax_on ~ ~0.15 ~ 0.6 0 0.6 0 1 force @a
execute if score @s buffoon.boss matches 13 run function buffoon:boss/meteor_fire
execute if score @s buffoon.boss matches 35 run function buffoon:boss/strike_impact
