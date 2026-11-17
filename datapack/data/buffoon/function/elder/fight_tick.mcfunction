execute as @e[type=elder_guardian,tag=buffoon.elder,limit=1] at @s run function buffoon:elder/boss_tick
# the anchor follows the Elder, so if the anchor is loaded but the Elder is gone, it died
execute at @e[type=marker,tag=buffoon.elder_anchor,limit=1] unless entity @e[type=elder_guardian,tag=buffoon.elder,distance=..10] run function buffoon:elder/death
# nobody nearby (chunk unloaded) - hide the bar until they come back
execute unless entity @e[type=marker,tag=buffoon.elder_anchor] run bossbar set buffoon:elder players
