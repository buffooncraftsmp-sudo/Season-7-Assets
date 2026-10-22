scoreboard players set #dmg buffoon.boss 0
$execute store success score #dmg buffoon.boss run damage @s $(a) buffoon:astral
$execute unless score #dmg buffoon.boss matches 1 run damage @s $(a) minecraft:magic
