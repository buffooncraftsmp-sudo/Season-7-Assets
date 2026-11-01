$execute unless data storage buffoon:event zones.$(planet)[0] run return run tellraw @s {text:"No zones on this planet.",color:"red"}
$data remove storage buffoon:event zones.$(planet)[-1]
tellraw @s {text:"Removed the last zone on this planet.",color:"#B48CFF"}
