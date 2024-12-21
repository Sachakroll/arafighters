// Fondu des barres de vie

if state = "fade1"
{
	cnum = 255*fade_timer/fade_time
}else
{
	cnum = 255
}

// Barres de vie

white = make_color_rgb(cnum, cnum, cnum)
red = make_color_rgb(cnum, 0, 0)

// Barres blanches
draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
ecart_x_barre_pv+taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv, white, white, white, white, false)
draw_rectangle_color(1280-ecart_x_barre_pv-taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv,
1280-ecart_x_barre_pv, ecart_y_barre_pv, white, white , white, white, false)

// Barres rouges
draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
ecart_x_barre_pv+taille_x_barre_pv*global.p1_inst.pv/global.p1_inst.max_pv,
ecart_y_barre_pv+taille_y_barre_pv, red, red, red, red, false)
draw_rectangle_color(1280-ecart_x_barre_pv-taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv,
1280-ecart_x_barre_pv-taille_x_barre_pv*(1-global.p2_inst.pv/global.p2_inst.max_pv),
ecart_y_barre_pv, red, red, red, red, false)
