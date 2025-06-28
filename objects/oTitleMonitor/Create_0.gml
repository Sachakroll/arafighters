state = "title"
timer = 0
selected_choice = 1
choice_cooldown = 0

char_cadres_do_move = true

easteregg_msg_timer = -1
easteregg_msg_duration = 80
easteregg_msg_text = ""

char_logo_y_position = 306
map_logo_y_position = 480
titleheight = 72
anim1_dur = 24

half_char_number = 5
p1_selected_char = 1
p2_selected_char = half_char_number

selected_map = "cour"
cour_rotonde_synchro = "cour"
l38_synchro = "cour"

selected_rules = 1

global.selected_options = 0
fade_timer_while_reentering_title = 0
fade_time_while_reentering_title = 60
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

// Placement des cadres de réglage des contrôles

instance_create_layer(0, 0, "Char", oOptions_controls,
{
	sprite_index : sOptions_controls_p1,
	player : 1
})
instance_create_layer(396, 0, "Char", oOptions_controls,
{
	sprite_index : sOptions_controls_p2,
	player : 2
})

// Initialisation des directions du joystick

p1_c_up = 0
p1_c_down = 0
p1_c_left = 0
p1_c_right = 0

p2_c_up = 0
p2_c_down = 0
p2_c_left = 0
p2_c_right = 0