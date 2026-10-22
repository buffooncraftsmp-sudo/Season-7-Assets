execute if entity @n[type=marker,tag=buffoon.ufo_slot_nav,distance=..0.6] unless score #nav buffoon.ufo matches 1 run return run function buffoon:ufo/nav/install
# wrong spot: pop it back out
setblock ~ ~ ~ minecraft:air
summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:cartography_table",count:1,components:{"minecraft:custom_name":{text:"Alien Navigation System",color:"#7CFF4F",italic:false,bold:true},"minecraft:lore":[{text:"A missing part from the crashed UFO",color:"gray",italic:true},{text:"Place it in its marked slot on the ship",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_ufo:"nav"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
tellraw @s {text:"That doesn't fit here - look for the glowing marker on the UFO.",color:"red"}
