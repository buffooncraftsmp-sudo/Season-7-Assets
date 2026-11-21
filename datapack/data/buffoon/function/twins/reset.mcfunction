# Resets one twin so it can be fought again - removes it, its guardians, its bossbar and an unclaimed key.
# Keys players already picked up are theirs to keep.
#   /function buffoon:twins/reset {side:"west"}
$execute unless data storage buffoon:twins sides.$(side) run return run tellraw @s {text:"Side must be \"west\" or \"east\".",color:"red"}
$scoreboard players set #$(side) buffoon.twins 0
$bossbar remove buffoon:twin_$(side)
$function buffoon:twins/despawn_mobs {side:"$(side)"}
$kill @e[type=marker,tag=buffoon.twin_anchor_$(side)]
$kill @e[type=item,tag=buffoon.twin_drop_$(side)]
$tellraw @s {text:"$(side) twin reset - ready to spawn again.",color:"#3FD8E0"}
