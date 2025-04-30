if state = "fade1"
{
	fade_timer += 1
	text_alpha += 2/fade_time
	if fade_timer = fade_time
	{
		state = "pre_jump"
	}
}

if state = "pre_jump"
{
	text_alpha = 1
	for (var i = 0; i <= gamepad_axis_count(gamepad); i++)
	{
	    if abs(gamepad_axis_value(gamepad, i)) > global.gp_deadzone
		{
			state = "jump"
			timer = 0
			vsp = -jump_force
			y_axis = i
			if gamepad_axis_value(gamepad, i) > 0
			{
				invert_y_axis = 1
			}
			if gamepad_axis_value(gamepad, i) < 0
			{
				invert_y_axis = 0
			}
			break
		}
	}
}

if state = "jump"
{
	timer ++
	vsp += g_acc
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Sautez avec un bouton !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_jump_btn"
		vsp = 0
	}
}

if state = "pre_jump_btn"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "jump_btn"
			timer = 0
			vsp = -jump_force
	        jump_button = i
	        break
	    }
	}
}

if state = "jump_btn"
{
	timer ++
	vsp += g_acc
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Avancez vers la droite avec le joystick !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_x_movement"
		vsp = 0
	}
}

if state = "pre_x_movement"
{
	text_alpha = 1
	for (var i = 0; i <= gamepad_axis_count(gamepad); i++)
	{
	    if abs(gamepad_axis_value(gamepad, i)) > global.gp_deadzone
		{
			state = "x_movement"
			oConfig_character.sprite_index = sGabriel_m_r_d
			timer = 0
			x_axis = i
			break
		}
	}
}

if state = "x_movement"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
		hsp += x_acc
	}
	if timer > time/2
	{
		written_text = "Donnez un coup basique !"
		text_alpha += 2/time
		hsp -= x_acc
	}
	if timer = time
	{
		oConfig_character.sprite_index = sGabriel_m_d
		state = "pre_atk"
		hsp = 0
	}
}

if state = "pre_atk"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "atk"
			timer = 0
	        action1_button = i
	        break
	    }
	}
}

if state = "atk"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Donnez un coup spécial !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_spe"
	}
}

if state = "pre_spe"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "spe"
			timer = 0
	        action2_button = i
	        break
	    }
	}
}

if state = "spe"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Utilisez votre bouclier !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_guard"
	}
}

if state = "pre_guard"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "guard"
			timer = 0
	        guard_button = i
	        break
	    }
	}
}

if state = "guard"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Essayez d'attraper l'adversaire !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_grab"
	}
}

if state = "pre_grab"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "grab"
			timer = 0
	        grab_button = i
	        break
	    }
	}
}

if state = "grab"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer > time/2
	{
		written_text = "Mettez le jeu en pause !"
		text_alpha += 2/time
	}
	if timer = time
	{
		state = "pre_pause"
	}
}

if state = "pre_pause"
{
	text_alpha = 1
	for (var i = 0; i < gamepad_button_count(gamepad); i++)
	{
	    if gamepad_button_check_pressed(gamepad, i)
		{
			state = "pause"
			timer = 0
	        pause_button = i
	        break
	    }
	}
}

if state = "pause"
{
	timer ++
	if timer < time/2
	{
		text_alpha -= 2/time
	}
	if timer = time/2
	{
		written_text = ""
		text_alpha = 0
		state = "fade2"
		fade_timer = fade_time
	}
}

if state = "fade2"
{
	fade_timer --
	if fade_timer = 0
	{
		// Assigner les contrôles configurés au joueur
		
		if global.config_player = 1
		{
			global.p1_gp_y_axis = y_axis
			global.p1_gp_invert_y_axis = invert_y_axis
			global.p1_gp_x_axis = x_axis
			global.p1_gp_jump = jump_button
			global.p1_gp_action1 = action1_button
			global.p1_gp_action2 = action2_button
			global.p1_gp_guard = guard_button
			global.p1_gp_grab = grab_button
			global.p1_gp_pause = pause_button
		}
		if global.config_player = 2
		{
			global.p2_gp_y_axis = y_axis
			global.p2_gp_invert_y_axis = invert_y_axis
			global.p2_gp_x_axis = x_axis
			global.p2_gp_jump = jump_button
			global.p2_gp_action1 = action1_button
			global.p2_gp_action2 = action2_button
			global.p2_gp_guard = guard_button
			global.p2_gp_grab = grab_button
			global.p2_gp_pause = pause_button
		}
		
		// Sauvegarder les nouveaux contrôles sur un fichier
		
		if global.config_player = 1
		{
			var _struct = {
				_y_axis : global.p1_gp_y_axis,
				_invert_y_axis : global.p1_gp_invert_y_axis,
				_x_axis : global.p1_gp_x_axis,
				_jump : global.p1_gp_jump,
				_act1 : global.p1_gp_action1,
				_act2 : global.p1_gp_action2,
				_guard : global.p1_gp_guard,
				_grab : global.p1_gp_grab,
				_pause : global.p1_gp_pause}
			var _string = json_stringify(_struct)
			var _file = file_text_open_write(string(gamepad_get_description(global.p1_controller))+".txt")
			file_text_write_string(_file, _string)
			file_text_close(_file)
		}
		if global.config_player = 2
		{
			var _struct = {
				_y_axis : global.p2_gp_y_axis,
				_invert_y_axis : global.p2_gp_invert_y_axis,
				_x_axis : global.p2_gp_x_axis,
				_jump : global.p2_gp_jump,
				_act1 : global.p2_gp_action1,
				_act2 : global.p2_gp_action2,
				_guard : global.p2_gp_guard,
				_grab : global.p2_gp_grab,
				_pause : global.p2_gp_pause}
			var _string = json_stringify(_struct)
			var _file = file_text_open_write(string(gamepad_get_description(global.p2_controller))+".txt")
			file_text_write_string(_file, _string)
			file_text_close(_file)
		}
		
		global.skip_title_after_config = true
		room_goto(Title)
	}
}

oConfig_character.x += hsp
oConfig_character.y += vsp