scoreboard players set #motor buffoon.pump 1
execute as @n[type=marker,tag=buffoon.pump_slot_motor,distance=..0.6] at @s run function buffoon:pump/motor/holo_hide
function buffoon:pump/count
particle minecraft:totem_of_undying ~ ~0.5 ~ 0.6 0.8 0.6 0.5 120 force @a
particle minecraft:electric_spark ~ ~ ~ 0.8 0.8 0.8 0.4 60 force @a
particle minecraft:end_rod ~ ~0.5 ~ 0.2 3 0.2 0.02 60 force @a
particle minecraft:dust{color:[0.85,0.82,0.25],scale:2.0f} ~ ~1 ~ 1.5 1.5 1.5 0 80 force @a
summon firework_rocket ~ ~10 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;14209088,16776960],fade_colors:[I;16777215],has_twinkle:true,has_trail:true}]}}}}
playsound minecraft:block.copper_bulb.turn_on block @a[distance=..64] ~ ~ ~ 3 0.8
playsound minecraft:block.end_portal_frame.fill block @a[distance=..64] ~ ~ ~ 3 0.8
playsound minecraft:entity.player.levelup block @a[distance=..64] ~ ~ ~ 2 1.2
playsound minecraft:block.piston.extend block @a[distance=..64] ~ ~ ~ 3 0.6
title @a[distance=..64] title {text:"Pump Motor Installed!",color:"#D8D040",bold:true}
title @a[distance=..64] subtitle [{score:{name:"#count",objective:"buffoon.pump"},color:"white"},{text:" of 3 pump parts repaired",color:"yellow"}]
tellraw @a [{text:"⚙ ",color:"#D8D040"},{selector:"@s"},{text:" installed the Pump Motor! ",color:"#D8D040"},{text:"(",color:"gray"},{score:{name:"#count",objective:"buffoon.pump"},color:"white"},{text:"/3)",color:"gray"}]
advancement grant @s only buffoon:s7/grease_monkey
