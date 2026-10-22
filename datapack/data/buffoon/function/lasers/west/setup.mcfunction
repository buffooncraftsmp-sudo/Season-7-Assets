summon marker ~ ~ ~ {Tags:["buffoon.laser","buffoon.laser_west"],data:{color:"[1.0,0.88,0.25]"}}
scoreboard players set #west buffoon.laser 1
forceload add ~ ~
playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 2 0.6
playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 1 1.5
tellraw @a [{text:"⚡ ",color:"#FFE040"},{selector:"@s"},{text:" has activated the west mining laser!",color:"#FFE040"}]
advancement grant @s until buffoon:s7/laser_focus
