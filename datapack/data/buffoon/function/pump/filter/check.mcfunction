execute if entity @n[type=marker,tag=buffoon.pump_slot_filter,distance=..0.6] unless score #filter buffoon.pump matches 1 run return run function buffoon:pump/filter/install
setblock ~ ~ ~ minecraft:air
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:hopper",count:1,components:{"minecraft:custom_name":{text:"Suction Filter",color:"#D8D040",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the drainage pump",color:"gray",italic:true},{text:"Place it in its marked slot on the pump",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_pump:"filter"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
tellraw @s {text:"That doesn't fit here - look for the glowing marker on the pump.",color:"red"}
