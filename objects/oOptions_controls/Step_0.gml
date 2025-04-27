// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

// Apparition et disparition

if oTitleMonitor.state = "choice to options"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "options to choice"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "options"
{
	image_alpha = 1
}
if oTitleMonitor.state = "choice"
{
	image_alpha = 0
}

if (global.p1_controller = -1 && player = 1) || (global.p2_controller = -1 && player = 2)
{image_index = 0}
else
{
	if (global.selected_options = 1.1 && player = 1) || (global.selected_options = 1.2 && player = 2)
	{image_index = 2}
	else {image_index = 1}
}