summon marker ~ ~ ~ {Tags:["buffoon.laser","buffoon.laser_south"],data:{color:"[0.25,0.8,1.0]"}}
scoreboard players set #south buffoon.laser 1
forceload add ~ ~
playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 2 0.6
playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 1 1.5
tellraw @a [{text:"⚡ ",color:"#40C8FF"},{selector:"@s"},{text:" has activated the south mining laser!",color:"#40C8FF"}]
advancement grant @s until buffoon:s7/laser_focus
