execute unless data storage buffoon:water rqueue[0] run return 0
data modify storage buffoon:water rq.id set from storage buffoon:water rqueue[0].id
data remove storage buffoon:water rqueue[0]
function buffoon:water/reset_one with storage buffoon:water rq
function buffoon:water/reset_loop
