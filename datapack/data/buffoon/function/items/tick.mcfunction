# Sulfur Treads: poison immunity
execute as @a if items entity @s armor.feet *[minecraft:custom_data~{buffoon_item:"sulfur_boots"}] run effect clear @s minecraft:poison
# Crown of the Deep: conduit power (water breathing, underwater night vision, faster underwater mining)
execute as @a if items entity @s armor.head *[minecraft:custom_data~{buffoon_item:"conduit_helmet"}] run effect give @s minecraft:conduit_power 15 0 true
