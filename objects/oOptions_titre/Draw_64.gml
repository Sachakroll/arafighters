draw_set_font(font_numbers)
draw_set_color(make_color_rgb(0,0,0))
if oTitleMonitor.selected_options = 0
{draw_set_alpha(image_alpha)}
else{draw_set_alpha(image_alpha*0.75)}

draw_text_transformed(draw_xpos, draw_ypos, string(abs(round(global.volume*100)))+"%", 2, 2, 0)

draw_set_alpha(1)