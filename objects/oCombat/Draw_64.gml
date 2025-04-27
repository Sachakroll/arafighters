// Fondu de l'interface

if state = "fade1"
{
	cnum = 255*fade_timer/fade_time
}else
{
	cnum = 255
}

// Barres de vie

white = make_color_rgb(cnum, cnum, cnum)
cvide = make_color_rgb(cnum, 0, 0)
cplein = make_color_rgb(cnum, cnum, 0)

// Barres rouges

draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
ecart_x_barre_pv+taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv, cvide, cvide, cvide, cvide, false)
draw_rectangle_color(1280-ecart_x_barre_pv-taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv,
1280-ecart_x_barre_pv, ecart_y_barre_pv, cvide, cvide , cvide, cvide, false)

// Barres jaunes

if global.p1_inst.pv != 0
{
	draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
	ecart_x_barre_pv+taille_x_barre_pv*global.p1_inst.pv/global.p1_inst.max_pv,
	ecart_y_barre_pv+taille_y_barre_pv, cplein, cplein, cplein, cplein, false)
}
if global.p2_inst.pv != 0
{
	draw_rectangle_color(1280-ecart_x_barre_pv-taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv,
	1280-ecart_x_barre_pv-taille_x_barre_pv*(1-global.p2_inst.pv/global.p2_inst.max_pv),
	ecart_y_barre_pv, cplein, cplein, cplein, cplein, false)
}

// Timer

displayed_seconds = floor(global.battle_timer/60)-60*floor(global.battle_timer/3600)
if displayed_seconds < 10 {displayed_seconds = "0"+string(displayed_seconds)}
else displayed_seconds = string(displayed_seconds)

displayed_minutes = string(floor(global.battle_timer/3600))
displayed_time = displayed_minutes+":"+displayed_seconds

draw_text_transformed_color(x_pos_timer, -ecart_y_barre_pv, displayed_time, 2, 2, 0, white, white, white, white, 1)

// Vies

if global.ruleset_style = "vies"
{
	if global.p2_inst.vies != 0 {p2_vies_nb_chiffres = floor(log10(global.p2_inst.vies)) + 1}
	else {p2_vies_nb_chiffres = 1}
	draw_text_transformed_color(ecart_x_barre_pv, taille_y_barre_pv, string(global.p1_inst.vies), 2, 2, 0, cvide, cvide, cvide, cvide, 1)
	draw_text_transformed_color(1280-ecart_x_barre_pv-p2_vies_nb_chiffres*x_char_size, taille_y_barre_pv, string(global.p2_inst.vies), 2, 2, 0, cvide, cvide, cvide, cvide, 1)
}
