# Gives you the trial spawner for one twin. Place it in the arena (in or next to water).
#   /function buffoon:twins/give_spawner {side:"west"}
$execute unless data storage buffoon:twins sides.$(side) run return run tellraw @s {text:"Side must be \"west\" or \"east\".",color:"red"}
$function buffoon:twins/give_spawner_do with storage buffoon:twins sides.$(side)
