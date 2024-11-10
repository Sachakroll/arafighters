if timer != -1 {timer += 1}
if choice_cooldown > 0 {choice_cooldown -= 1}

// Touches du clavier

key_gl_cp_ok = keyboard_check_pressed(global.player1_key_action1) || keyboard_check_pressed(global.player2_key_action1)
key_gl_cp_back = keyboard_check_pressed(global.player1_key_action2) || keyboard_check_pressed(global.player2_key_action2)
key_gl_cp_up = keyboard_check_pressed(global.player1_key_jump) || keyboard_check_pressed(global.player2_key_jump)
key_gl_cp_down = keyboard_check_pressed(global.player1_key_sneak) || keyboard_check_pressed(global.player2_key_sneak)

key_p1_cp_up = keyboard_check_pressed(global.player1_key_jump)
key_p1_cp_down = keyboard_check_pressed(global.player1_key_sneak)
key_p1_cp_left = keyboard_check_pressed(global.player1_key_left)
key_p1_cp_right = keyboard_check_pressed(global.player1_key_right)

key_p2_cp_up = keyboard_check_pressed(global.player2_key_jump)
key_p2_cp_down = keyboard_check_pressed(global.player2_key_sneak)
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
		if selected_choice = 4
		{
			game_end()
		}
	}
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
	if key_gl_cp_ok
	{
		state = "rules to map"
		timer = 0
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
}

show_debug_message(p1_selected_char)
show_debug_message("state = "+state)