kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:cartography_table"}}]
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:cartography_table",count:1,components:{"minecraft:custom_name":{text:"Alien Navigation System",color:"#7CFF4F",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the crashed UFO",color:"gray",italic:true},{text:"Place it in its marked slot on the ship",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_ufo:"nav"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
scoreboard players set #nav buffoon.ufo 0
playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 2 1
function buffoon:ufo/nav/holo_show
