tp @e[type=marker,tag=buffoon.elder_anchor,limit=1] ~ ~ ~
execute store result score #hp buffoon.elder run data get entity @s Health
execute store result bossbar buffoon:elder value run scoreboard players get #hp buffoon.elder
bossbar set buffoon:elder players @a[distance=..64]
# minions every 15s, every 10s once below half health
scoreboard players add #t buffoon.elder 1
execute if score #hp buffoon.elder matches ..120 if score #t buffoon.elder matches 200.. run function buffoon:elder/summon_minions
execute if score #t buffoon.elder matches 300.. run function buffoon:elder/summon_minions
