kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:waxed_copper_bulb"}}]
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:waxed_copper_bulb",count:1,components:{"minecraft:custom_name":{text:"Pressure Valve",color:"#D8D040",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the drainage pump",color:"gray",italic:true},{text:"Place it in its marked slot on the pump",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_pump:"valve"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
scoreboard players set #valve buffoon.pump 0
playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 2 1
function buffoon:pump/valve/holo_show
