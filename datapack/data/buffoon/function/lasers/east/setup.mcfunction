summon marker ~ ~ ~ {Tags:["buffoon.laser","buffoon.laser_east"],data:{color:"[0.45,1.0,0.25]"}}
scoreboard players set #east buffoon.laser 1
forceload add ~ ~
playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 2 0.6
playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 1 1.5
tellraw @a [{text:"⚡ ",color:"#7CFF40"},{selector:"@s"},{text:" has activated the east mining laser!",color:"#7CFF40"}]
advancement grant @s until buffoon:s7/laser_focus
