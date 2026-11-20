# Water has reached the chosen level
$scoreboard players set #$(id).moving buffoon.water 0
$execute store result storage buffoon:water snd.y int 1 run scoreboard players get #$(id).cur buffoon.water
$data modify storage buffoon:water snd.id set value "$(id)"
$data modify storage buffoon:water snd.dim set value "$(dim)"
$data modify storage buffoon:water snd.cx set value $(cx)
$data modify storage buffoon:water snd.cz set value $(cz)
function buffoon:water/arrive_do with storage buffoon:water snd
