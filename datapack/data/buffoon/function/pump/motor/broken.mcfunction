kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:blast_furnace"}}]
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:blast_furnace",count:1,components:{"minecraft:custom_name":{text:"Pump Motor",color:"#D8D040",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the drainage pump",color:"gray",italic:true},{text:"Place it in its marked slot on the pump",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_pump:"motor"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
scoreboard players set #motor buffoon.pump 0
playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 2 1
function buffoon:pump/motor/holo_show
