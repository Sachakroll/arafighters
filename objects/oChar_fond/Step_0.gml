// Sélection

if oTitleMonitor.p1_selected_char = owner.char_number
{
	image_index = 1
}
else
{
	if oTitleMonitor.p2_selected_char = owner.char_number
	{
		image_index = 2
	}
	else {image_index = 0}
}