state = "title"
timer = 0
selected_choice = 1
choice_cooldown = 0

char_cadres_do_move = true

global.easteregg_state = 0
easteregg_msg_timer = -1
easteregg_msg_duration = 80
easteregg_msg_text = ""

char_logo_y_position = 300
map_logo_y_position = 436
titleheight = 72
anim1_dur = 24

half_char_number = 5
p1_selected_char = 1
p2_selected_char = half_char_number

selected_map = "cour"
cour_rotonde_synchro = "cour"
l38_synchro = "cour"

selected_rules = 1
global.ruleset_style = "vies"

selected_options = 0
alternating_bit = 0

load_time = 120
goto_delay = 30
load_timer = 0
load_logo_start = 540
load_logo_movement = 640

characters_short_names_list = ["Gab", "Potv", "Grj", "Mouv", "Sousa", "Huv", "Suppl1", "Lmb", "Bern", "Bubu"]

init = 0

// Placement des cadres de personnages

for (var i = 1; i <= half_char_number*2; i += 1)
{
	var _cadre = instance_create_layer(cadre_x(i), cadre_y(i), "Char", oChar_cadre, {
		sprite_index : asset_get_index("sChar_cadre_"+characters_short_names_list[i-1]),
		char_number : i
	})
	instance_create_layer(0, 0, "Char", oChar_nom, {
		sprite_index : asset_get_index("sChar_nom_"+characters_short_names_list[i-1]),
		owner : _cadre
	})
	instance_create_layer(0, 0, "Char", oChar_fond, {owner : _cadre})
}