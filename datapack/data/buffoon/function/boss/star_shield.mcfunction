execute if score #shield buffoon.boss matches 1.. run scoreboard players remove #shield buffoon.boss 1
execute if score #shield buffoon.boss matches 1 run function buffoon:boss/star_shield_end
execute if score #crystals buffoon.boss matches 0 if score #shield buffoon.boss matches 0 run scoreboard players remove #shcd buffoon.boss 1
execute if score #shcd buffoon.boss matches ..0 run function buffoon:boss/star_shield_start
