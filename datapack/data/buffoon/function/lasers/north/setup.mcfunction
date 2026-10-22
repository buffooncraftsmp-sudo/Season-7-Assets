summon marker ~ ~ ~ {Tags:["buffoon.laser","buffoon.laser_north"],data:{color:"[1.0,0.2,0.2]"}}
scoreboard players set #north buffoon.laser 1
forceload add ~ ~
playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 2 0.6
playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 1 1.5
tellraw @a [{text:"⚡ ",color:"#FF4040"},{selector:"@s"},{text:" has activated the north mining laser!",color:"#FF4040"}]
advancement grant @s until buffoon:s7/laser_focus
