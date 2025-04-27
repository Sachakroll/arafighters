if init = 0
{
	init = 1
	
	title_logo_y_position = oLogo.y
	title_titre_y_position = oTitre.y
	
	// Revenir de la configuration de la manette

	if global.skip_title_after_config = true
	{
		oTitre.y_center -= titleheight
		oLogo.y_center += (char_logo_y_position-title_logo_y_position)
		state = "options"
		fade_timer_while_reentering_title = fade_time_while_reentering_title
		global.selected_options = 1
		global.skip_title_after_config = false
	}
}