kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:hopper"}}]
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:hopper",count:1,components:{"minecraft:custom_name":{text:"Suction Filter",color:"#D8D040",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the drainage pump",color:"gray",italic:true},{text:"Place it in its marked slot on the pump",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_pump:"filter"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
scoreboard players set #filter buffoon.pump 0
playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 2 1
function buffoon:pump/filter/holo_show
