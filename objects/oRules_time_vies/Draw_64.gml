draw_set_font(font_numbers)
draw_set_color(make_color_rgb(0,0,0))
if oTitleMonitor.selected_rules = 2
{draw_set_alpha(oRules_titre.image_alpha)}
else{draw_set_alpha(oRules_titre.image_alpha*0.75)}

if global.ruleset_style = "vies"
{draw_text_transformed(draw_xposition_vies, draw_height, string(global.ruleset_vies), 2, 2, 0)}
if global.ruleset_style = "temps"
{draw_text_transformed(draw_xposition_time, draw_height, string(global.ruleset_time), 2, 2, 0)}
	
draw_set_alpha(1)