# Ops: copies every puzzle zone on one planet INTO its master copy. Only run this when all of that
# planet's puzzles are in their starting state - whatever is there now becomes what resets restore.
#   function buffoon:event/save {planet:"mars"}
$function buffoon:event/job/start {dir:"save",planets:["$(planet)"]}
