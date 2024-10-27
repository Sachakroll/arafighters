if timer != -1 {timer += 1}
if choice_cooldown > 0 {choice_cooldown -= 1}

if state = "title"
{
	if keyboard_check_pressed(ok_key)
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
	if keyboard_check_pressed(back_key)
	{
		state = "choice to title"
		timer = 0
	}
	if selected_choice > 1 && keyboard_check_pressed(up_key) && choice_cooldown = 0
	{
		selected_choice -= 1
		choice_cooldown = 2
	}
	if selected_choice < 4 && keyboard_check_pressed(down_key) && choice_cooldown = 0
	{
		selected_choice += 1
		choice_cooldown = 2
	}
	if keyboard_check_pressed(ok_key)
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
	if keyboard_check_pressed(back_key)
	{
		state = "char to choice"
		timer = 0
	}
}

show_debug_message("state = "+state)