kill @e[type=block_display,tag=buffoon.boss_bubble]
execute if score #shielded buffoon.boss matches 1 unless score #glow buffoon.boss matches 1 run function buffoon:boss/glow_on
execute if score #shielded buffoon.boss matches 0 if score #glow buffoon.boss matches 1 run function buffoon:boss/glow_off
