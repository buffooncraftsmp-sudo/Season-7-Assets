scoreboard players set #state buffoon.nexus 2
effect clear @a[distance=..64] minecraft:darkness
effect clear @a[distance=..64] minecraft:nausea
particle minecraft:explosion_emitter ~ ~1 ~ 1 1 1 0 6 force @a
particle minecraft:totem_of_undying ~ ~2 ~ 2 2 2 0.8 800 force @a
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.6 300 force @a
particle minecraft:trial_omen ~ ~2 ~ 3 3 3 0.1 200 force @a
summon firework_rocket ~ ~14 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;11832575,16758311,6346735,4183264],fade_colors:[I;16777215],has_twinkle:true,has_trail:true}]}}}}
summon firework_rocket ~6 ~12 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"star",colors:[I;16758311],has_twinkle:true}]}}}}
summon firework_rocket ~-6 ~12 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"star",colors:[I;14697259],has_twinkle:true}]}}}}
summon firework_rocket ~ ~12 ~6 {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"star",colors:[I;14209088],has_twinkle:true}]}}}}
summon firework_rocket ~ ~12 ~-6 {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"star",colors:[I;4183264],has_twinkle:true}]}}}}
playsound minecraft:entity.generic.explode master @a[distance=..96] ~ ~ ~ 8 0.5
playsound minecraft:block.end_portal.spawn master @a[distance=..96] ~ ~ ~ 100 1
playsound minecraft:block.beacon.activate master @a[distance=..96] ~ ~ ~ 100 0.8
playsound minecraft:ui.toast.challenge_complete master @a[distance=..96] ~ ~ ~ 100 1
kill @e[tag=buffoon.nexus_star]
summon item_display ~ ~2.5 ~ {Tags:["buffoon.nexus_star"],item:{id:"minecraft:nether_star",count:1},Glowing:1b,glow_color_override:11832575,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.6f,1.6f,1.6f]}}
summon item ~ ~1.2 ~ {PickupDelay:40,Age:-32768,Glowing:1b,Motion:[0.0,0.2,0.0],Item:{id:"minecraft:nether_star",count:1,components:{"minecraft:custom_name":{text:"The Astronomer's Stone",color:"#B48CFF",italic:false,bold:true},"minecraft:lore":[{text:"Forged when four worlds aligned",color:"gray",italic:true},{text:"It hums with the light of distant stars",color:"dark_purple",italic:false}],"minecraft:custom_data":{buffoon_stone:"astronomer"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic"}}}
effect give @a[distance=..64] minecraft:regeneration 30 1 true
effect give @a[distance=..64] minecraft:absorption 120 3 true
effect give @a[distance=..64] minecraft:hero_of_the_village 600 0 true
experience add @a[distance=..64] 30 levels
advancement grant @a[distance=..64] until buffoon:s7/the_convergence
title @a[distance=..64] times 10 80 30
title @a[distance=..64] title {text:"THE CONVERGENCE",color:"#B48CFF",bold:true}
title @a[distance=..64] subtitle {text:"The Astronomer's Stone has awakened",color:"gold"}
tellraw @a [{text:"✦ ",color:"#B48CFF"},{text:"Four worlds aligned. The Astronomer's Stone has awakened.",color:"#B48CFF",bold:true}]
function buffoon:nexus/on_complete
