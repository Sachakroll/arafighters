// Fondu de l'interface

if state = "fade1" || state = "fade2"
{
	cnum = 255*fade_timer/fade_time
}else
{
	cnum = 255
}

// Calcul des valeurs affichées des barres de vie

if p1_displayed_pv = global.p1_inst.pv {p1_old_pv = global.p1_inst.pv}
else{
	if global.p1_inst.pv = global.p1_inst.max_pv {p1_displayed_pv -= (p1_old_pv-global.p1_inst.pv)/barre_pv_refill_time}
	else {p1_displayed_pv -= (p1_old_pv-global.p1_inst.pv)/barre_pv_dmg_time}
}
if p1_displayed_pv > global.p1_inst.max_pv {p1_displayed_pv = global.p1_inst.pv}

if p2_displayed_pv = global.p2_inst.pv {p2_old_pv = global.p2_inst.pv}
else{
	if global.p2_inst.pv = global.p2_inst.max_pv {p2_displayed_pv -= (p2_old_pv-global.p2_inst.pv)/barre_pv_refill_time}
	else{p2_displayed_pv -= (p2_old_pv-global.p2_inst.pv)/barre_pv_dmg_time}
}
if p2_displayed_pv > global.p2_inst.max_pv {p2_displayed_pv = global.p2_inst.pv}

// Couleurs des barres de vie

white = make_color_rgb(cnum, cnum, cnum)
cvide = make_color_rgb(cnum, 0, 0)
cplein = make_color_rgb(cnum, cnum, 0)

// Barres vides

draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
ecart_x_barre_pv+taille_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv, cvide, cvide, cvide, cvide, false)
draw_rectangle_color(1279-ecart_x_barre_pv-taille_x_barre_pv, ecart_y_barre_pv,
1279-ecart_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv, cvide, cvide , cvide, cvide, false)

// Barres pleines

if p1_displayed_pv != 0
{
	draw_rectangle_color(ecart_x_barre_pv, ecart_y_barre_pv,
	ecart_x_barre_pv+taille_x_barre_pv*p1_displayed_pv/global.p1_inst.max_pv,
	ecart_y_barre_pv+taille_y_barre_pv, cplein, cplein, cplein, cplein, false)
}
if p2_displayed_pv != 0
{
	draw_rectangle_color(1279-ecart_x_barre_pv+taille_x_barre_pv*((1-p2_displayed_pv/global.p2_inst.max_pv)-1),
	ecart_y_barre_pv, 1279-ecart_x_barre_pv, ecart_y_barre_pv+taille_y_barre_pv,
	cplein, cplein, cplein, cplein, false)
}

// Timer

displayed_seconds = floor(global.battle_timer/60)-60*floor(global.battle_timer/3600)
if displayed_seconds < 10 {displayed_seconds = "0"+string(displayed_seconds)}
else displayed_seconds = string(displayed_seconds)

displayed_minutes = string(floor(global.battle_timer/3600))
displayed_time = displayed_minutes+":"+displayed_seconds

draw_text_transformed_color(x_pos_timer, y_pos_timer, displayed_time, 2, 2, 0, white, white, white, white, 1)

// Cadre de la barre de vie

draw_sprite_ext(sBattle_cadre_vies_fond, 0, 0, 0, 2, 2, 0, c_white, 1)

draw_sprite_ext(sCombat_portrait_Mouv, 0, 12+ecart_x_barre_pv/2, 26, 2, 2, 0, c_white, 1)
draw_sprite_ext(sCombat_portrait_Mouv, 0, 1279-12-ecart_x_barre_pv/2, 26, 2, 2, 0, c_white, 1)

draw_sprite_ext(sBattle_cadre_vies, 0, 0, 0, 2, 2, 0, c_white, 1)

// Vies

if global.ruleset_style = "vies"
{
	var c_vies = make_colour_rgb(95, 0, 0)
	var p1_dclg = 0
	var p2_dclg = 0
	if global.p1_inst.vies > 9 {var p1_dclg = 12}
	if global.p2_inst.vies > 9 {var p2_dclg = 12}
	
	draw_text_transformed_color(x_pos_vies-p1_dclg, y_pos_vies, string(global.p1_inst.vies), 2, 2, 0, c_vies, c_vies, c_vies, c_vies, 1)
	draw_text_transformed_color(1280-x_pos_vies-p2_dclg-26, y_pos_vies, string(global.p2_inst.vies), 2, 2, 0, c_vies, c_vies, c_vies, c_vies, 1)
}