kill @e[type=item_display,tag=buffoon.stone_mars,distance=..1.5,limit=1,sort=nearest]
kill @e[type=interaction,tag=buffoon.stone_mars,distance=..1.5,limit=1,sort=nearest]
execute if block ~ ~ ~ minecraft:light run setblock ~ ~ ~ air
summon item ~ ~0.5 ~ {PickupDelay:10,Item:{id:"minecraft:shroomlight",count:1,components:{"minecraft:custom_name":{text:"Astronomer's Stone of Mars",color:"#E0452B",italic:false,bold:true},"minecraft:lore":[{text:"Still warm from the red planet's core",color:"gray",italic:true},{text:"Place it in the world to complete the mission",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_stone:"mars"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
kill @s
