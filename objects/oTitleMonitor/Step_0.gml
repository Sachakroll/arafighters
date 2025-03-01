if timer != -1 {timer += 1}
if choice_cooldown > 0 {choice_cooldown -= 1}

alternating_bit = 1 - alternating_bit

// Touches du clavier

key_gl_cp_ok = keyboard_check_pressed(global.player1_key_action1) || keyboard_check_pressed(global.player2_key_action1)
key_gl_cp_back = keyboard_check_pressed(global.player1_key_action2) || keyboard_check_pressed(global.player2_key_action2)
key_gl_cp_up = keyboard_check_pressed(global.player1_key_up) || keyboard_check_pressed(global.player2_key_up)
key_gl_cp_down = keyboard_check_pressed(global.player1_key_down) || keyboard_check_pressed(global.player2_key_down)
key_gl_cp_left = keyboard_check_pressed(global.player1_key_left) || keyboard_check_pressed(global.player2_key_left)
key_gl_cp_right = keyboard_check_pressed(global.player1_key_right) || keyboard_check_pressed(global.player2_key_right)

key_p1_cp_ok = keyboard_check_pressed(global.player1_key_action1)
key_p1_cp_up = keyboard_check_pressed(global.player1_key_up)
key_p1_cp_down = keyboard_check_pressed(global.player1_key_down)
key_p1_cp_left = keyboard_check_pressed(global.player1_key_left)
key_p1_cp_right = keyboard_check_pressed(global.player1_key_right)
key_p1_c_left = keyboard_check(global.player1_key_left)
key_p1_c_right = keyboard_check(global.player1_key_right)

key_p2_cp_up = keyboard_check_pressed(global.player2_key_up)
key_p2_cp_down = keyboard_check_pressed(global.player2_key_down)
key_p2_cp_left = keyboard_check_pressed(global.player2_key_left)
key_p2_cp_right = keyboard_check_pressed(global.player2_key_right)

// Écran titre

if state = "title"
{
	if key_gl_cp_ok
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
	if key_gl_cp_back
	{
		state = "choice to title"
		timer = 0
	}
	if selected_choice > 1 && key_gl_cp_up && choice_cooldown = 0
	{
		selected_choice -= 1
		choice_cooldown = 2
	}
	if selected_choice < 4 && key_gl_cp_down && choice_cooldown = 0
	{
		selected_choice += 1
		choice_cooldown = 2
	}
	if key_gl_cp_ok
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
	selected_options = 0
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

if state = "options"
{
	if key_gl_cp_back
	{
		state = "options to choice"
		timer = 0
	}
	if selected_options = 0
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
			selected_options = 1
		}
	}
	if key_p1_cp_up && selected_options = 1
	{
		selected_options = 0
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
	if key_gl_cp_back
	{
		state = "char to choice"
		timer = 0
	}
	if key_gl_cp_ok
	{
		state = "char to rules"
		timer = 0
	}
	
	// Player 1 selection
	
	if key_p1_cp_down || key_p1_cp_up
	{
		if p1_selected_char < half_char_number+1 && p2_selected_char != p1_selected_char + half_char_number
		{
			p1_selected_char += half_char_number
		}else
		{
			if p1_selected_char > half_char_number && p2_selected_char != p1_selected_char - half_char_number
			{
				p1_selected_char -= half_char_number
			}
		}
	}
	if key_p1_cp_left
	{
		if p1_selected_char != 1 && p1_selected_char != half_char_number+1 && p2_selected_char != p1_selected_char - 1
		{
			p1_selected_char -= 1
		}else
		{
			if (p1_selected_char = 1 || p1_selected_char = half_char_number+1) && p2_selected_char != p1_selected_char + half_char_number-1
			{
				p1_selected_char += half_char_number-1
			}
		}
	}
	if key_p1_cp_right
	{
		if p1_selected_char != half_char_number && p1_selected_char != half_char_number*2 && p2_selected_char != p1_selected_char + 1
		{
			p1_selected_char += 1
		}else
		{
			if (p1_selected_char = half_char_number || p1_selected_char = half_char_number*2) && p2_selected_char != p1_selected_char + -half_char_number+1
			{
				p1_selected_char += -half_char_number+1
			}
		}
	}
	
	// Player 2 selection
	
	if key_p2_cp_down || key_p2_cp_up
	{
		if p2_selected_char < half_char_number+1 && p1_selected_char != p2_selected_char + half_char_number
		{
			p2_selected_char += half_char_number
		}else
		{
			if p2_selected_char > half_char_number && p1_selected_char != p2_selected_char - half_char_number
			{
				p2_selected_char -= half_char_number
			}
		}
	}
	if key_p2_cp_left
	{
		if p2_selected_char != 1 && p2_selected_char != half_char_number+1 && p1_selected_char != p2_selected_char - 1
		{
			p2_selected_char -= 1
		}else
		{
			if (p2_selected_char = 1 || p2_selected_char = half_char_number+1) && p1_selected_char != p2_selected_char + half_char_number-1
			{
				p2_selected_char += half_char_number-1
			}
		}
	}
	if key_p2_cp_right
	{
		if p2_selected_char != half_char_number && p2_selected_char != half_char_number*2 && p1_selected_char != p2_selected_char + 1
		{
			p2_selected_char += 1
		}else
		{
			if (p2_selected_char = half_char_number || p2_selected_char = half_char_number*2) && p1_selected_char != p2_selected_char + -half_char_number+1
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
	if key_gl_cp_back
	{
		state = "rules to char"
		timer = 0
	}
	
	if selected_rules = 1
	{
		if key_gl_cp_left || key_gl_cp_right
		{
			if global.ruleset_style = "vies"
			{
				global.ruleset_style = "temps"
			}else
			{
				global.ruleset_style = "vies"
			}
		}
		if key_gl_cp_down || key_gl_cp_ok
		{
			selected_rules = 2
		}
	}else
	{
		if selected_rules = 2
		{
			if key_gl_cp_down || key_gl_cp_ok
			{
				selected_rules = 3
			}
			if key_gl_cp_up
			{
				selected_rules = 1
			}
			if global.ruleset_style = "temps"
			{
				if key_gl_cp_left && global.ruleset_time > 1
				{
					global.ruleset_time -= 1
				}
				if key_gl_cp_right
				{
					global.ruleset_time += 1
				}
			}
			if global.ruleset_style = "vies"
			{
				if key_gl_cp_left && global.ruleset_vies > 1
				{
					global.ruleset_vies -= 1
				}
				if key_gl_cp_right
				{
					global.ruleset_vies += 1
				}
			}
		}else
		{
			if selected_rules = 3
			{
				if key_gl_cp_up
				{
					selected_rules = 2
				}
				if key_gl_cp_ok
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
	if key_gl_cp_back
	{
		state = "map to rules"
		timer = 0
	}
	if key_gl_cp_ok
	{
		state = "map to load"
		timer = 0
	}
	
	if selected_map = "cour"
	{
		cour_rotonde_synchro = "cour"
		l38_synchro = "cour"
		if key_gl_cp_right
		{
			selected_map = "rot"
		}else
		{
			if key_gl_cp_down
			{
				selected_map = "stud"
			}else
			{
				if key_gl_cp_up
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
			if key_gl_cp_right
			{
				selected_map = "jard"
			}else
			{
				if key_gl_cp_left
				{
					selected_map = "cour"
				}else
				{
					if key_gl_cp_down
					{
						selected_map = "stud"
					}else
					{
						if key_gl_cp_up
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
				if key_gl_cp_right
				{
					selected_map = "bus"
				}else
				{
					if key_gl_cp_down
					{
						selected_map = "bus"
					}else
					{
						if key_gl_cp_up
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
							if key_gl_cp_left
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
					if key_gl_cp_left
					{
						selected_map = "rot"
					}else
					{
						if key_gl_cp_down
						{
							selected_map = "bus"
						}else
						{
							if key_gl_cp_up || key_gl_cp_right
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
						if key_gl_cp_down || key_gl_cp_left
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
							if key_gl_cp_left
							{
								selected_map = "stud"
							}else
							{
								if key_gl_cp_up
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
	}
}
if state = "load to map"
{
	if timer = anim1_dur
	{
		timer = -1
		state = "map"
	}
}

if state = "load"
{
	load_timer += 1
	if load_timer = load_time + goto_delay
	{
		// Chargement
		
		if p1_selected_char = 1 {global.player1_char = oGabriel}
		if p2_selected_char = 1 {global.player2_char = oGabriel}
		if p1_selected_char = 2 {global.player1_char = oPotvin}
		if p2_selected_char = 2 {global.player2_char = oPotvin}
		if p1_selected_char = 3 {global.player1_char = oGrandjean}
		if p2_selected_char = 3 {global.player2_char = oGrandjean}
		if p1_selected_char = 4 {global.player1_char = oMouvet}
		if p2_selected_char = 4 {global.player2_char = oMouvet}
		if p1_selected_char = 5 {global.player1_char = oSousa}
		if p2_selected_char = 5 {global.player2_char = oSousa}
		if p1_selected_char = 6 {global.player1_char = oHuvelle}
		if p2_selected_char = 6 {global.player2_char = oHuvelle}
		if p1_selected_char = 7 {global.player1_char = oSuppl_1}
		if p2_selected_char = 7 {global.player2_char = oSuppl_1}
		if p1_selected_char = 8 {global.player1_char = oLambe}
		if p2_selected_char = 8 {global.player2_char = oLambe}
		if p1_selected_char = 9 {global.player1_char = oBernard}
		if p2_selected_char = 9 {global.player2_char = oBernard}
		if p1_selected_char = 10 {global.player1_char = oBurniat}
		if p2_selected_char = 10 {global.player2_char = oBurniat}
		
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

show_debug_message("state = "+state)