# Runs at the Elder's last position
scoreboard players set #state buffoon.elder 2
bossbar remove buffoon:elder
kill @e[type=marker,tag=buffoon.elder_anchor]
function buffoon:elder/despawn_mobs
# drop the Astronomer's Stone of Coralline
summon item ~ ~0.5 ~ {Item:{id:"minecraft:sea_lantern",count:1},Tags:["buffoon.elder_drop"],PickupDelay:20,Age:-32768,Glowing:1b}
item replace entity @n[type=item,tag=buffoon.elder_drop] contents with minecraft:sea_lantern[minecraft:custom_name={text:"Astronomer's Stone of Coralline",color:"#3FD8E0",italic:false,bold:true},minecraft:lore=[{text:"Pulled from the deepest ocean trench",color:"gray",italic:true},{text:"Place it in the world to complete the mission",color:"dark_gray",italic:false}],minecraft:custom_data={buffoon_stone:"water_planet"},minecraft:item_model="minecraft:conduit",minecraft:enchantment_glint_override=true,minecraft:rarity="epic",minecraft:max_stack_size=1]
# the loot chest with the Crown of the Deep
execute align xyz positioned ~0.5 ~ ~0.5 run function buffoon:elder/place_chest
particle minecraft:nautilus ~ ~ ~ 2 2 2 1 400 force @a
particle minecraft:bubble_column_up ~ ~ ~ 2 2 2 0.3 300 force @a
playsound minecraft:ui.toast.challenge_complete master @a[distance=..96] ~ ~ ~ 1 1
playsound minecraft:entity.elder_guardian.death hostile @a[distance=..96] ~ ~ ~ 4 0.6
title @a[distance=..96] title {text:"The Coralline Elder has fallen",color:"#3FD8E0",bold:true}
title @a[distance=..96] subtitle {text:"Its hoard rests where it died",color:"gray",italic:true}
tellraw @a [{text:"✦ ",color:"#3FD8E0"},{text:"The Coralline Elder has been defeated! The Astronomer's Stone of Coralline sinks to the seabed.",color:"#3FD8E0"}]
