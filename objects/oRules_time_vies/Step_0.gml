// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

draw_height = 2*base_draw_height + 2*sin(angle)*etendue

// Apparition et disparition

image_alpha = oRules_titre.image_alpha

// Style

if global.ruleset_style = "vies"
{
	sprite_index = sRules_vies
	if oTitleMonitor.selected_rules = 2
	{image_index = 0}
	else {image_index = 1}
}
if global.ruleset_style = "temps"
{
	sprite_index = sRules_time
	if oTitleMonitor.selected_rules = 2
	{
		if global.ruleset_time = 1
		{image_index = 1}
		else {image_index = 0}
	}else
	{
		if global.ruleset_time = 1
		{image_index = 3}
		else {image_index = 2}
	}
}