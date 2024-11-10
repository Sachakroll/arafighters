// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

// Apparition et disparition

if oTitleMonitor.state = "char to rules" || oTitleMonitor.state = "map to rules"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "rules to char" || oTitleMonitor.state = "rules to map"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "rules"
{
	image_alpha = 1
}
if oTitleMonitor.state = "char" || oTitleMonitor.state = "map"
{
	image_alpha = 0
}