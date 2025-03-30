if global.p1_controller != -1
{
	draw_set_font(font_numbers)
	draw_set_color(make_color_rgb(0,0,0))

	if oTitleMonitor.selected_controls = 0 && oTitleMonitor.selected_options = 1.1 {draw_set_alpha(image_alpha)}
	else{draw_set_alpha(image_alpha*0.75)}
	draw_text_transformed(draw_xpos_1, draw_ypos_0, string(global.p1_gp_x_axis), 2, 2, 0)

	if oTitleMonitor.selected_controls = 1 && oTitleMonitor.selected_options = 1.1 {draw_set_alpha(image_alpha)}
	else{draw_set_alpha(image_alpha*0.75)}
	draw_text_transformed(draw_xpos_1, draw_ypos_1, string(global.p1_gp_y_axis), 2, 2, 0)

	if oTitleMonitor.selected_controls = 2 && oTitleMonitor.selected_options = 1.1 {draw_set_alpha(image_alpha)}
	else{draw_set_alpha(image_alpha*0.75)}
	draw_text_transformed(draw_xpos_2, draw_ypos_2, string(global.p1_gp_action1), 2, 2, 0)

	if oTitleMonitor.selected_controls = 3 && oTitleMonitor.selected_options = 1.1 {draw_set_alpha(image_alpha)}
	else{draw_set_alpha(image_alpha*0.75)}
	draw_text_transformed(draw_xpos_2, draw_ypos_3, string(global.p1_gp_action2), 2, 2, 0)
	
	draw_set_alpha(1)
}