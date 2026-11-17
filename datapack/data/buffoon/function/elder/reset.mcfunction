# Full reset so the fight can run again: removes the Elder, minions, bossbar, loot chest and any
# unclaimed stone. Anything in an unloaded chunk is cleared when it next loads.
# Players keep anything they've already picked up.
scoreboard players set #state buffoon.elder 0
bossbar remove buffoon:elder
function buffoon:elder/despawn_mobs
kill @e[type=marker,tag=buffoon.elder_anchor]
kill @e[type=item,tag=buffoon.elder_drop]
tag @e[type=marker,tag=buffoon.elder_chest] add buffoon.elder_clear
execute as @e[type=marker,tag=buffoon.elder_clear] at @s run function buffoon:elder/clear_chest
tellraw @s {text:"Coralline Elder reset - ready to spawn again.",color:"#3FD8E0"}
