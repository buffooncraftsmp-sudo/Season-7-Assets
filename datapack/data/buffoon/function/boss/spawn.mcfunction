kill @e[tag=buffoon.boss_body]
kill @e[tag=buffoon.boss_orbit]
summon marker ~ ~ ~ {Tags:["buffoon.boss_orbit","buffoon.boss_ent"]}
summon mannequin ~ ~12 ~12 {Tags:["buffoon.boss","buffoon.boss_body","buffoon.boss_ent"],CustomName:{text:"The Astronomer",color:"#B48CFF",bold:true},CustomNameVisible:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:2.22}],equipment:{mainhand:{id:"minecraft:nether_star",count:1}}}
execute if score #skin buffoon.boss matches 1 run function buffoon:boss/apply_skin
execute positioned ~ ~12 ~12 run summon zombie ~ ~ ~ {Tags:["buffoon.boss_hitbox","buffoon.boss_body","buffoon.boss_ent"],NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,CanPickUpLoot:0b,IsBaby:0b,DeathLootTable:"minecraft:empty",Health:1000f,attributes:[{id:"minecraft:max_health",base:1000},{id:"minecraft:scale",base:2.05},{id:"minecraft:knockback_resistance",base:1}],active_effects:[{id:"minecraft:invisibility",duration:-1,amplifier:0,show_particles:0b},{id:"minecraft:fire_resistance",duration:-1,amplifier:0,show_particles:0b}]}
summon item_display ~ ~14 ~12 {Tags:["buffoon.boss_star","buffoon.boss_body","buffoon.boss_ent"],item:{id:"minecraft:nether_star",count:1},Glowing:1b,glow_color_override:11832575,teleport_duration:1,brightness:{sky:15,block:15},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.9f,0.9f,0.9f]}}
particle minecraft:reverse_portal ~ ~12 ~12 2 3 2 0.3 400 force @a
particle minecraft:end_rod ~ ~12 ~12 1 3 1 0.2 200 force @a
playsound minecraft:block.conduit.activate master @a[distance=..150] ~ ~ ~ 6 0.5
playsound minecraft:block.end_portal.spawn master @a[distance=..150] ~ ~ ~ 6 0.7
playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..150] ~ ~ ~ 6 0.5
playsound minecraft:entity.warden.sonic_charge master @a[distance=..150] ~ ~ ~ 6 0.6
playsound minecraft:block.amethyst_block.resonate master @a[distance=..150] ~ ~ ~ 6 0.5
playsound minecraft:block.amethyst_block.resonate master @a[distance=..150] ~ ~ ~ 6 0.75
schedule function buffoon:boss/spawn_crack 30t
scoreboard players set #hp buffoon.boss 55
scoreboard players set #shield buffoon.boss 0
scoreboard players set #shcd buffoon.boss 400
bossbar add buffoon:boss {text:"The Astronomer",color:"#B48CFF",bold:true}
bossbar set buffoon:boss max 55
bossbar set buffoon:boss value 55
bossbar set buffoon:boss color purple
bossbar set buffoon:boss style notched_10
bossbar set buffoon:boss players @a[distance=..150,gamemode=!spectator]
title @a[distance=..150] title {text:"The Astronomer",color:"#B48CFF",bold:true}
title @a[distance=..150] subtitle {text:"Keeper of the Four Stones",color:"gray",italic:true}
scoreboard players set #glow buffoon.boss 0
execute as @e[type=mannequin,tag=buffoon.boss,limit=1] at @s run tellraw @a[distance=..150] [{text:"The Astronomer: ",color:"#B48CFF",bold:true},{text:"So. The stones have done their work. I have everything I need now.",color:"white",italic:true}]
schedule function buffoon:boss/say_1 600t replace
schedule function buffoon:boss/say_2 1200t replace
schedule function buffoon:boss/say_3 1800t replace
schedule function buffoon:boss/say_4 2400t replace
