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

// Sélection

if oTitleMonitor.selected_map = "cour"
{
	image_index = 0
}
if oTitleMonitor.selected_map = "rot"
{
	image_index = 1
}
if oTitleMonitor.selected_map = "stud"
{
	image_index = 2
}
if oTitleMonitor.selected_map = "jard"
{
	image_index = 3
}
if oTitleMonitor.selected_map = "l38"
{
	image_index = 4
}
if oTitleMonitor.selected_map = "bus"
{
	image_index = 5
}