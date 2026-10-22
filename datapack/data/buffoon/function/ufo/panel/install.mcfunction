scoreboard players set #panel buffoon.ufo 1
execute as @n[type=marker,tag=buffoon.ufo_slot_panel,distance=..0.6] at @s run function buffoon:ufo/panel/holo_hide
scoreboard players operation #count buffoon.ufo = #core buffoon.ufo
scoreboard players operation #count buffoon.ufo += #nav buffoon.ufo
scoreboard players operation #count buffoon.ufo += #panel buffoon.ufo
# fanfare
particle minecraft:totem_of_undying ~ ~0.5 ~ 0.6 0.8 0.6 0.5 120 force @a
particle minecraft:happy_villager ~ ~ ~ 1 1 1 0 40 force @a
particle minecraft:electric_spark ~ ~ ~ 0.8 0.8 0.8 0.4 60 force @a
particle minecraft:end_rod ~ ~0.5 ~ 0.2 3 0.2 0.02 60 force @a
particle minecraft:dust{color:[0.5,1.0,0.3],scale:2.0f} ~ ~1 ~ 1.5 1.5 1.5 0 80 force @a
summon firework_rocket ~ ~10 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;8191823,65280],fade_colors:[I;16777215],has_twinkle:true,has_trail:true}]}}}}
playsound minecraft:block.beacon.activate block @a[distance=..64] ~ ~ ~ 3 1.6
playsound minecraft:block.end_portal_frame.fill block @a[distance=..64] ~ ~ ~ 3 0.8
playsound minecraft:entity.player.levelup block @a[distance=..64] ~ ~ ~ 2 1.2
playsound minecraft:block.respawn_anchor.charge block @a[distance=..64] ~ ~ ~ 3 1.2
title @a[distance=..64] title {text:"Alien Control Panel Installed!",color:"#7CFF4F",bold:true}
title @a[distance=..64] subtitle [{score:{name:"#count",objective:"buffoon.ufo"},color:"white"},{text:" of 3 ship parts repaired",color:"green"}]
tellraw @a [{text:"🛸 ",color:"#7CFF4F"},{selector:"@s"},{text:" installed the Alien Control Panel! ",color:"#7CFF4F"},{text:"(",color:"gray"},{score:{name:"#count",objective:"buffoon.ufo"},color:"white"},{text:"/3)",color:"gray"}]
advancement grant @s only buffoon:s7/grease_monkey
