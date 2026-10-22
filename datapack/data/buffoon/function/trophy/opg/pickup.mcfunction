kill @e[tag=buffoon.trophy_opg,type=!marker,distance=..1.5]
execute if block ~ ~ ~ minecraft:light run setblock ~ ~ ~ minecraft:air
summon item ~ ~0.5 ~ {PickupDelay:5,Item:{id:"minecraft:crying_obsidian",count:1,components:{"minecraft:custom_name":{text:"OPG's Astronomer Trophy",color:"#B48CFF",italic:false,bold:true},"minecraft:lore":[{text:"Awarded for defeating the Astronomer",color:"gray",italic:true},{text:"Buffooncraft Season 7",color:"gold",italic:false},{text:"Place it to display it - punch it to pick it back up",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_stone:"trophy_opg"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
playsound minecraft:entity.item.pickup block @a ~ ~ ~ 1 0.8
kill @s
