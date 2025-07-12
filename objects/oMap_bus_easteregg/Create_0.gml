x = 0
y = 0

if global.easteregg_state = 1
{
	visible = true
	sprite_index = sMap_bus_easteregg_piou
}
else if global.easteregg_state = 2
{
	visible = true
	sprite_index = sMap_bus_easteregg_smileman
}
else {visible = false}

depth = oMap_bus.depth - 1
