execute unless data storage buffoon:water queue[0] run return 0
data modify storage buffoon:water q set from storage buffoon:water queue[0]
data remove storage buffoon:water queue[0]
function buffoon:water/loop_do with storage buffoon:water q
function buffoon:water/loop
