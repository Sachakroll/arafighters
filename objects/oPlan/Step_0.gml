// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

// Apparition et disparition

if oTitleMonitor.state = "rules to map" || oTitleMonitor.state = "load to map"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "map to rules" || oTitleMonitor.state = "map to load"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "map"
{
	image_alpha = 1
}
if oTitleMonitor.state = "rules" || oTitleMonitor.state = "load"
{
	image_alpha = 0
}