data merge entity @s {Health:1000f}
execute if score #state buffoon.boss matches 3 run return 0
execute if score #shielded buffoon.boss matches 1 at @n[type=mannequin,tag=buffoon.boss] run return run function buffoon:boss/hit_blocked
function buffoon:boss/take_hit
