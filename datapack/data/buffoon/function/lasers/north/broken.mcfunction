summon item ~ ~ ~ {PickupDelay:10,Item:{id:"minecraft:red_stained_glass",count:1,components:{"minecraft:custom_name":{text:"Laser Beam Magnifier (North)",color:"#FF4040",italic:false,bold:true},"minecraft:lore":[{text:"Focusing lens for the north mining laser",color:"gray",italic:true},{text:"Place it on the laser to fire it at the comet core",color:"dark_gray",italic:false}],"minecraft:custom_data":{buffoon_laser:"north"},"minecraft:enchantment_glint_override":true,"minecraft:rarity":"epic","minecraft:max_stack_size":1}}}
scoreboard players set #north buffoon.laser 0
playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 2 0.8
kill @s
