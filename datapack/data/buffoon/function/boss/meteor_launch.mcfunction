tag @s add buffoon.meteor_cur
tag @s remove buffoon.meteor_launch
execute as @e[type=marker,tag=buffoon.boss_strike] if score @s buffoon.mid = @n[type=block_display,tag=buffoon.meteor_cur] buffoon.mid at @s run tp @n[type=block_display,tag=buffoon.meteor_cur] ~ ~0.45 ~
tag @s remove buffoon.meteor_cur
