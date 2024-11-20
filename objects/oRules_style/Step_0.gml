// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

// Apparition et disparition

image_alpha = oRules_titre.image_alpha

// Sélection

if oTitleMonitor.selected_rules = 1
{
	if global.ruleset_style = "vies"
	{image_index = 0}
	if global.ruleset_style = "temps"
	{image_index = 1}
}
if oTitleMonitor.selected_rules != 1
{
	if global.ruleset_style = "vies"
	{image_index = 2}
	if global.ruleset_style = "temps"
	{image_index = 3}
}
