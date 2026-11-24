# Checkpoint button: sets the player's respawn to fixed coordinates (in the dimension they're in) and tells them.
# Command block (Impulse, Needs Redstone) behind a button:
#   execute as @p[distance=..4] at @s run function buffoon:checkpoint/set {x:100,y:64,z:-200}
$spawnpoint @s $(x) $(y) $(z)
function buffoon:checkpoint/announce
