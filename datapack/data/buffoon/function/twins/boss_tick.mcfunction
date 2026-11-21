$tp @e[type=marker,tag=buffoon.twin_anchor_$(side),limit=1] ~ ~ ~
$execute store result score #$(side).hp buffoon.twins run data get entity @s Health
$execute store result bossbar buffoon:twin_$(side) value run scoreboard players get #$(side).hp buffoon.twins
$bossbar set buffoon:twin_$(side) players @a[distance=..48]
# guardians every 15s, every 10s once below half health
$scoreboard players add #$(side).t buffoon.twins 1
$execute if score #$(side).hp buffoon.twins matches ..75 if score #$(side).t buffoon.twins matches 200.. run function buffoon:twins/summon_minions {side:"$(side)"}
$execute if score #$(side).t buffoon.twins matches 300.. run function buffoon:twins/summon_minions {side:"$(side)"}
