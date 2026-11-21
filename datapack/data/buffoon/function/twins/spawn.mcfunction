# Spawns one of the Tide Twins where this runs. Ops or a command block:
#   function buffoon:twins/spawn {side:"west"}     (Undertow)
#   function buffoon:twins/spawn {side:"east"}     (Riptide)
$execute unless data storage buffoon:twins sides.$(side) run return run tellraw @s {text:"Side must be \"west\" or \"east\".",color:"red"}
$function buffoon:twins/spawn_do with storage buffoon:twins sides.$(side)
