if timer != -1 {timer += 1}
if choice_cooldown > 0 {choice_cooldown -= 1}

alternating_bit = 1 - alternating_bit

// Initialisation des touches

key_p1_cp_ok = false
key_p1_cp_back = false

key_p1_cp_up = false
key_p1_cp_down = false
key_p1_cp_left = false
key_p1_cp_right = false

key_p1_c_left = false
key_p1_c_right = false

key_p2_cp_up = false
key_p2_cp_down = false
key_p2_cp_left = false
key_p2_cp_right = false

// Manettes

if global.p1_controller != -1
{
	var prev_c_up = p1_c_up
	var prev_c_down = p1_c_down
	var prev_c_left = p1_c_left
	var prev_c_right = p1_c_right
	
	var move_x = gamepad_axis_value(global.p1_controller, global.p1_gp_x_axis)
	var move_y = gamepad_axis_value(global.p1_controller, global.p1_gp_y_axis)
	p1_c_left = move_x < -global.gp_deadzone
	p1_c_right = move_x > global.gp_deadzone
	if global.p1_gp_invert_y_axis{
		p1_c_up = move_y > global.gp_deadzone
		p1_c_down = move_y < -global.gp_deadzone
	}else{
		p1_c_up = move_y < -global.gp_deadzone
		p1_c_down = move_y > global.gp_deadzone
	}
	key_p1_cp_up = p1_c_up && !prev_c_up
	key_p1_cp_down = p1_c_down && !prev_c_down
	key_p1_cp_left = p1_c_left && !prev_c_left
	key_p1_cp_right = p1_c_right && !prev_c_right
	key_p1_c_left = p1_c_left
	key_p1_c_right = p1_c_right
	key_p1_cp_ok = gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action1)
	key_p1_cp_back = gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action2)
}

if global.p2_controller != -1
{ 
	var prev_c_up = p2_c_up
	var prev_c_down = p2_c_down
	var prev_c_left = p2_c_left
	var prev_c_right = p2_c_right
	
	var move_x = gamepad_axis_value(global.p2_controller, global.p2_gp_x_axis)
	var move_y = gamepad_axis_value(global.p2_controller, global.p2_gp_y_axis)
	p2_c_left = move_x < -global.gp_deadzone
	p2_c_right = move_x > global.gp_deadzone
	if global.p2_gp_invert_y_axis{
		p2_c_up = move_y > global.gp_deadzone
		p2_c_down = move_y < -global.gp_deadzone
	}else{
		p2_c_up = move_y < -global.gp_deadzone
		p2_c_down = move_y > global.gp_deadzone
	}
	key_p2_cp_up = p2_c_up && !prev_c_up
	key_p2_cp_down = p2_c_down && !prev_c_down
	key_p2_cp_left = p2_c_left && !prev_c_left
	key_p2_cp_right = p2_c_right && !prev_c_right
}

// Touches du clavier

key_p1_cp_ok = keyboard_check_pressed(global.player1_key_action1) || key_p1_cp_ok
key_p1_cp_back = keyboard_check_pressed(global.player1_key_action2) || key_p1_cp_back

key_p1_cp_up = keyboard_check_pressed(global.player1_key_up) || key_p1_cp_up
key_p1_cp_down = keyboard_check_pressed(global.player1_key_down) || key_p1_cp_down
key_p1_cp_left = keyboard_check_pressed(global.player1_key_left) || key_p1_cp_left
key_p1_cp_right = keyboard_check_pressed(global.player1_key_right) || key_p1_cp_right

key_p1_c_left = keyboard_check(global.player1_key_left) || key_p1_c_left
key_p1_c_right = keyboard_check(global.player1_key_right) || key_p1_c_right

key_p2_cp_up = keyboard_check_pressed(global.player2_key_up) || key_p2_cp_up
key_p2_cp_down = keyboard_check_pressed(global.player2_key_down) || key_p2_cp_down
key_p2_cp_left = keyboard_check_pressed(global.player2_key_left) || key_p2_cp_left
key_p2_cp_right = keyboard_check_pressed(global.player2_key_right) || key_p2_cp_right

// Écran titre

if state = "title"
{
	if key_p1_cp_ok
	{
		state = "title to choice"
		timer = 0
	}
}

if state = "title to choice"
{
	oLogo.y_center += (char_logo_y_position-title_logo_y_position)/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "choice"
		oLogo.y_center = char_logo_y_position
	}
}
if state = "choice to title"
{
	oLogo.y_center -= (char_logo_y_position-title_logo_y_position)/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "title"
		oLogo.y_center = title_logo_y_position
	}
}

if state = "choice"
{
	if key_p1_cp_back
	{
		state = "choice to title"
		timer = 0
	}
	if selected_choice > 1 && key_p1_cp_up && choice_cooldown = 0
	{
		selected_choice -= 1
		choice_cooldown = 2
	}
	if selected_choice < 4 && key_p1_cp_down && choice_cooldown = 0
	{
		selected_choice += 1
		choice_cooldown = 2
	}
	if key_p1_cp_ok
	{
		if selected_choice = 1
		{
			state = "choice to char"
			timer = 0
		}
		if selected_choice = 3
		{
			state = "choice to options"
			timer = 0
		}
		if selected_choice = 4
		{
			game_end()
		}
	}
}

if state = "choice to options"
{
	global.selected_options = 0
	oTitre.y_center -= titleheight/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "options"
	}
}
if state = "options to choice"
{
	oTitre.y_center += titleheight/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "choice"
		oTitre.y_center = title_titre_y_position
	}
}

if fade_timer_while_reentering_title != 0 {fade_timer_while_reentering_title --}

if state = "options"
{
	if key_p1_cp_back
	{
		state = "options to choice"
		timer = 0
	}
	if global.selected_options = 0
	{
		if key_p1_cp_left || key_p1_cp_right {alternating_bit = 1}
		if key_p1_c_left && global.volume > 0 && alternating_bit = 1
		{
			global.volume -= 0.01
		}
		if key_p1_c_right && global.volume < 1 && alternating_bit = 1
		{
			global.volume += 0.01
		}
		if key_p1_cp_ok
		{
			if global.volume > 0 {global.volume = 0}
			else {global.volume = 1}
		}
		if key_p1_cp_down
		{
			global.selected_options = 1
		}
	}
	if global.selected_options = 1
	{
		if key_p1_cp_up
		{
			global.selected_options = 0
		}
		if key_p1_cp_left && global.p1_controller != -1
		{
			global.selected_options = 1.1
		}
		if key_p1_cp_right && global.p2_controller != -1
		{
			global.selected_options = 1.2
		}
	}
	if (global.selected_options = 1.1 || global.selected_options = 1.2) && key_p1_cp_up
	{
		global.selected_options = 0
	}
	if global.selected_options = 1.1
	{
		if key_p1_cp_right || global.p1_controller = -1 {global.selected_options = 1}
		if key_p1_cp_ok
		{
			global.config_player = 1
			room_goto(Config)
		}
	}
	if global.selected_options = 1.2
	{
		if key_p1_cp_left || global.p2_controller = -1 {global.selected_options = 1}
		if key_p1_cp_ok
		{
			global.config_player = 2
			room_goto(Config)
		}
	}
	global.volume = round(100*global.volume)/100
}

if state = "choice to char"
{
	oTitre.y_center -= titleheight/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "char"
	}
}
if state = "char to choice"
{
	oTitre.y_center += titleheight/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "choice"
		oTitre.y_center = title_titre_y_position
	}
}

if state = "char"
{
	if key_p1_cp_back
	{
		state = "char to choice"
		timer = 0
	}
	if key_p1_cp_ok
	{
		state = "char to rules"
		timer = 0
	}
	
	// Player 1 selection
	
	if key_p1_cp_down || key_p1_cp_up
	{
		if p1_selected_char < half_char_number+1
		{
			p1_selected_char += half_char_number
		}else
		{
			if p1_selected_char > half_char_number
			{
				p1_selected_char -= half_char_number
			}
		}
	}
	if key_p1_cp_left
	{
		if p1_selected_char != 1 && p1_selected_char != half_char_number+1
		{
			p1_selected_char -= 1
		}else
		{
			if (p1_selected_char = 1 || p1_selected_char = half_char_number+1)
			{
				p1_selected_char += half_char_number-1
			}
		}
	}
	if key_p1_cp_right
	{
		if p1_selected_char != half_char_number && p1_selected_char != half_char_number*2
		{
			p1_selected_char += 1
		}else
		{
			if (p1_selected_char = half_char_number || p1_selected_char = half_char_number*2)
			{
				p1_selected_char += -half_char_number+1
			}
		}
	}
	
	// Player 2 selection
	
	if key_p2_cp_down || key_p2_cp_up
	{
		if p2_selected_char < half_char_number+1
		{
			p2_selected_char += half_char_number
		}else
		{
			if p2_selected_char > half_char_number
			{
				p2_selected_char -= half_char_number
			}
		}
	}
	if key_p2_cp_left
	{
		if p2_selected_char != 1 && p2_selected_char != half_char_number+1
		{
			p2_selected_char -= 1
		}else
		{
			if (p2_selected_char = 1 || p2_selected_char = half_char_number+1)
			{
				p2_selected_char += half_char_number-1
			}
		}
	}
	if key_p2_cp_right
	{
		if p2_selected_char != half_char_number && p2_selected_char != half_char_number*2
		{
			p2_selected_char += 1
		}else
		{
			if (p2_selected_char = half_char_number || p2_selected_char = half_char_number*2)
			{
				p2_selected_char += -half_char_number+1
			}
		}
	}
}

if state = "char to rules"
{
	if timer = anim1_dur
	{
		timer = -1
		state = "rules"
	}
}
if state = "rules to char"
{
	if timer = anim1_dur
	{
		timer = -1
		state = "char"
	}
}

if state = "rules"
{
	if key_p1_cp_back
	{
		state = "rules to char"
		timer = 0
	}
	
	if selected_rules = 1
	{
		if key_p1_cp_left || key_p1_cp_right
		{
			if global.ruleset_style = "vies"
			{
				global.ruleset_style = "temps"
			}else
			{
				global.ruleset_style = "vies"
			}
		}
		if key_p1_cp_down || key_p1_cp_ok
		{
			selected_rules = 2
		}
	}else
	{
		if selected_rules = 2
		{
			if key_p1_cp_down || key_p1_cp_ok
			{
				selected_rules = 3
			}
			if key_p1_cp_up
			{
				selected_rules = 1
			}
			if global.ruleset_style = "temps"
			{
				if key_p1_cp_left && global.ruleset_time > 1
				{
					global.ruleset_time -= 1
				}
				if key_p1_cp_right
				{
					global.ruleset_time += 1
				}
			}
			if global.ruleset_style = "vies"
			{
				if key_p1_cp_left && global.ruleset_vies > 1
				{
					global.ruleset_vies -= 1
				}
				if key_p1_cp_right
				{
					global.ruleset_vies += 1
				}
			}
		}else
		{
			if selected_rules = 3
			{
				if key_p1_cp_up
				{
					selected_rules = 2
				}
				if key_p1_cp_ok
				{
					state = "rules to map"
					timer = 0
				}
			}
		}
	}
}

if state = "rules to map"
{
	oLogo.y_center += (map_logo_y_position-char_logo_y_position)/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "map"
		oLogo.y_center = map_logo_y_position
	}
}
if state = "map to rules"
{
	oLogo.y_center -= (map_logo_y_position-char_logo_y_position)/anim1_dur
	if timer = anim1_dur
	{
		timer = -1
		state = "rules"
		oLogo.y_center = char_logo_y_position
	}
}

if state = "map"
{
	if key_p1_cp_back
	{
		state = "map to rules"
		timer = 0
	}
	if key_p1_cp_ok
	{
		state = "map to load"
		timer = 0
	}
	
	if selected_map = "cour"
	{
		cour_rotonde_synchro = "cour"
		l38_synchro = "cour"
		if key_p1_cp_right
		{
			selected_map = "rot"
		}else
		{
			if key_p1_cp_down
			{
				selected_map = "stud"
			}else
			{
				if key_p1_cp_up
				{
					selected_map = "l38"
				}
			}
		}
	}
	else
	{
		if selected_map = "rot"
		{
			cour_rotonde_synchro = "rot"
			l38_synchro = "rot"
			if key_p1_cp_right
			{
				selected_map = "jard"
			}else
			{
				if key_p1_cp_left
				{
					selected_map = "cour"
				}else
				{
					if key_p1_cp_down
					{
						selected_map = "stud"
					}else
					{
						if key_p1_cp_up
						{
							selected_map = "l38"
						}
					}
				}
			}
		}
		else
		{
			if selected_map = "stud"
			{
				if key_p1_cp_right
				{
					selected_map = "bus"
				}else
				{
					if key_p1_cp_down
					{
						selected_map = "bus"
					}else
					{
						if key_p1_cp_up
						{
							if cour_rotonde_synchro = "cour"
							{
								selected_map = "cour"
							}
							if cour_rotonde_synchro = "rot"
							{
								selected_map = "rot"
							}
						}else
						{
							if key_p1_cp_left
							{
								cour_rotonde_synchro = "cour"
							}
						}
					}
				}
			}
			else
			{
				if selected_map = "jard"
				{
					cour_rotonde_synchro = "cour"
					l38_synchro = "jard"
					if key_p1_cp_left
					{
						selected_map = "rot"
					}else
					{
						if key_p1_cp_down
						{
							selected_map = "bus"
						}else
						{
							if key_p1_cp_up || key_p1_cp_right
							{
								selected_map = "l38"
							}
						}
					}
				}
				else
				{
					if selected_map = "l38"
					{
						cour_rotonde_synchro = "cour"
						if key_p1_cp_down || key_p1_cp_left
						{
							if l38_synchro = "cour"
							{
								selected_map = "cour"
							}
							if l38_synchro = "rot"
							{
								selected_map = "rot"
							}
							if l38_synchro = "jard"
							{
								selected_map = "jard"
							}
						}
					}
					else
					{
						if selected_map = "bus"
						{
							cour_rotonde_synchro = "cour"
							if key_p1_cp_left
							{
								selected_map = "stud"
							}else
							{
								if key_p1_cp_up
								{
									selected_map = "jard"
								}
							}
						}
					}
				}
			}
		}
	}
}

if state = "map to load"
{
	if timer = anim1_dur
	{
		timer = -1
		state = "load"
		load_timer = 0
		oLogo.y = load_logo_start
		
		// Arrêter la musique de l'écran titre
		audio_sound_gain(global.music, 0, load_time*50/3)
	}
}

if state = "load"
{
	load_timer += 1
	if load_timer = load_time + goto_delay
	{
		// Chargement
		
		if p1_selected_char = 1 {global.player1_char = oGabriel
			global.player1_hitbox_sprite = sGabriel_hitbox}
		if p2_selected_char = 1 {global.player2_char = oGabriel
			global.player2_hitbox_sprite = sGabriel_hitbox}
		if p1_selected_char = 2 {global.player1_char = oMouvet
			global.player1_hitbox_sprite = sMouvet_hitbox}
		if p2_selected_char = 2 {global.player2_char = oMouvet
			global.player2_hitbox_sprite = sMouvet_hitbox}
		if p1_selected_char = 3 {global.player1_char = oLambe
			global.player1_hitbox_sprite = sLambe_hitbox}
		if p2_selected_char = 3 {global.player2_char = oLambe
			global.player2_hitbox_sprite = sLambe_hitbox}
		if p1_selected_char = 4 {global.player1_char = oSousa
			global.player1_hitbox_sprite = sSousa_hitbox}
		if p2_selected_char = 4 {global.player2_char = oSousa
			global.player2_hitbox_sprite = sSousa_hitbox}
		if p1_selected_char = 5 {global.player1_char = oLabiffe
			global.player1_hitbox_sprite = sLabiffe_hitbox}
		if p2_selected_char = 5 {global.player2_char = oLabiffe
			global.player2_hitbox_sprite = sLabiffe_hitbox}
		if p1_selected_char = 6 {global.player1_char = oBernard
			global.player1_hitbox_sprite = sBernard_hitbox}
		if p2_selected_char = 6 {global.player2_char = oBernard
			global.player2_hitbox_sprite = sBernard_hitbox}
		
		if selected_map = "cour" {global.map = Map_cour}
		if selected_map = "rot" {global.map = Map_cour}
		if selected_map = "stud" {global.map = Map_cour}
		if selected_map = "jard" {global.map = Map_cour}
		if selected_map = "l38" {global.map = Map_cour}
		if selected_map = "bus" {global.map = Map_bus}
		
		// Début du combat
		
		room_goto(global.map)
	}
	oLogo.y_center -= load_logo_movement/load_time
}