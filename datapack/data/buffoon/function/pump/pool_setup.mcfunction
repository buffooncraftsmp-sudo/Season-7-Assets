$forceload add $(wminx) $(wminz) $(wmaxx) $(wmaxz)
$forceload add 5000 5000 $(vx2) $(vz2)
kill @e[type=marker,tag=buffoon.pump_center]
$summon marker $(cx) $(cy) $(cz) {Tags:["buffoon.pump_center"]}
scoreboard players set #poolset buffoon.pump 1
schedule function buffoon:pump/snapshot 40t
tellraw @s {text:"Pool area saved. Snapshotting the full pool in 2 seconds - make sure it's full of water!",color:"#D8D040"}
