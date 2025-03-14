if easteregg_msg_timer >= 0 && easteregg_msg_timer < easteregg_msg_duration
{
	easteregg_msg_timer ++
	
	draw_set_color(c_white)
	draw_set_alpha(sin(pi*easteregg_msg_timer/easteregg_msg_duration))
	
	if global.easteregg_state = 1 {easteregg_msg_text = "Le mode Piou a été activé !"}
	if global.easteregg_state = 2 {easteregg_msg_text = "Le mode Smileman a été activé !"}
	
	draw_text_transformed(42, 624, easteregg_msg_text, 2, 2, 0)
	draw_set_alpha(1)
}