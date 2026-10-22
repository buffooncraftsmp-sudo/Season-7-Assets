# Stand where the portal (and tp_home) should send players back to
data modify storage buffoon:boss home.dim set from entity @s Dimension
execute store result storage buffoon:boss home.x double 1 run data get entity @s Pos[0]
execute store result storage buffoon:boss home.y double 1 run data get entity @s Pos[1]
execute store result storage buffoon:boss home.z double 1 run data get entity @s Pos[2]
tellraw @s {text:"Return point set here - the Moon portal and tp_home will send players to this spot.",color:"#B48CFF"}
