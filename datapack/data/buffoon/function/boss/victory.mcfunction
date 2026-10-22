scoreboard players set #state buffoon.boss 6
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:explosion_emitter ~ ~2 ~ 1 1 1 0 6 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:totem_of_undying ~ ~2 ~ 2 2 2 0.8 800 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.7 300 force @a
execute at @n[type=mannequin,tag=buffoon.boss] run summon firework_rocket ~ ~8 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;11832575,16758311,14209088,14697259,4183264],fade_colors:[I;16777215],has_twinkle:true,has_trail:true}]}}}}
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:entity.generic.explode master @a[distance=..200] ~ ~ ~ 8 0.5
execute at @n[type=mannequin,tag=buffoon.boss] run playsound minecraft:ui.toast.challenge_complete master @a[distance=..200] ~ ~ ~ 100 1
kill @e[tag=buffoon.boss_body]
kill @e[type=end_crystal,tag=buffoon.boss_crystal]
kill @e[type=item_display,tag=buffoon.boss_stone]
scoreboard players set #alive_comet buffoon.boss 0
scoreboard players set #alive_gas_giant buffoon.boss 0
scoreboard players set #alive_mars buffoon.boss 0
scoreboard players set #alive_water_planet buffoon.boss 0
execute at @n[type=marker,tag=buffoon.boss_center] run experience add @a[distance=..150,gamemode=!spectator] 50 levels
execute at @n[type=marker,tag=buffoon.boss_center] run effect give @a[distance=..150] minecraft:regeneration 30 2 true
execute at @n[type=marker,tag=buffoon.boss_center] run advancement grant @a[distance=..150] until buffoon:s7/starbreaker
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] times 10 100 30
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] title {text:"THE UNIVERSE IS SAVED",color:"gold",bold:true}
execute at @n[type=marker,tag=buffoon.boss_center] run title @a[distance=..150] subtitle {text:"The Astronomer has fallen - the four worlds are free",color:"#B48CFF"}
tellraw @a [{text:"✦ ",color:"gold"},{text:"The Astronomer has been defeated and the universe is saved! ",color:"gold",bold:true},{text:"A portal home has opened at the heart of the Moon.",color:"#B48CFF"}]
execute at @n[type=marker,tag=buffoon.boss_center] run function buffoon:boss/portal_open
function buffoon:boss/on_complete
execute at @n[type=marker,tag=buffoon.boss_center] positioned ~6 ~ ~ run function buffoon:boss/trophy_plinth
tellraw @a[distance=..200] {text:"A barrel of trophies has appeared beside the portal - one for every Buffoon.",color:"gold"}
