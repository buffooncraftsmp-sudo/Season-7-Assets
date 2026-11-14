$data modify storage buffoon:event tmp.z.src set value "buffoon:$(planet)"
$data modify storage buffoon:event tmp.z.dst set value "buffoon:$(planet)_master"
function buffoon:event/op/copy
