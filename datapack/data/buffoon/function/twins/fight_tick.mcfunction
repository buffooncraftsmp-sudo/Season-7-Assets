$execute as @e[type=drowned,tag=buffoon.twin_$(side),limit=1] at @s run function buffoon:twins/boss_tick {side:"$(side)"}
# the anchor follows the twin, so if the anchor is loaded but the twin is gone, it died
$execute at @e[type=marker,tag=buffoon.twin_anchor_$(side),limit=1] unless entity @e[type=drowned,tag=buffoon.twin_$(side),distance=..10] run function buffoon:twins/death with storage buffoon:twins sides.$(side)
# nobody nearby (chunk unloaded) - hide the bar until they come back
$execute unless entity @e[type=marker,tag=buffoon.twin_anchor_$(side)] run bossbar set buffoon:twin_$(side) players
