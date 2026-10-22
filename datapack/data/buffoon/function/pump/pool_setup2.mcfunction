$forceload add $(x1) $(z1) $(x2) $(z2)
forceload add 5000 5000 5040 5040
kill @e[type=marker,tag=buffoon.pump_center]
$summon marker $(cx) $(cy) $(cz) {Tags:["buffoon.pump_center"]}
scoreboard players set #poolset2 buffoon.pump 1
scoreboard players set #poolset buffoon.pump 0
schedule function buffoon:pump/snapshot2 40t
tellraw @s {text:"Pool set. Saving it in 2 seconds - make sure it's full of water!",color:"#D8D040"}
