//Récupération des touches pressées

if player = 1
{
	key_left = keyboard_check(global.player1_key_left)
	key_right = keyboard_check(global.player1_key_right)
	key_jump = keyboard_check_pressed(global.player1_key_jump)
	key_sneak = keyboard_check(global.player1_key_sneak)
}

if player = 2
{
	key_left = keyboard_check(global.player2_key_left)
	key_right = keyboard_check(global.player2_key_right)
	key_jump = keyboard_check_pressed(global.player2_key_jump)
	key_sneak = keyboard_check(global.player2_key_sneak)
}

//Mouvement

move = key_right - key_left

if key_sneak {sneak = true}
if !key_sneak && !place_meeting(x, y-sneak_pixel_difference, oCollision)
{sneak = false}

if sneak {if abs(hsp+(move*sneaksp)) <= max_sneaksp
	{hsp += move * sneaksp}
	else {hsp = max_sneaksp * sign(hsp)}
	grv = sneak_grv}

if !sneak {if abs(hsp+(move*walksp)) <= max_walksp
	{hsp += move * walksp}
	else {hsp = max_walksp * sign(hsp)}
	grv = normal_grv}

if place_meeting(x, y+1, oCollision)
     {on_ground = true}
else {on_ground = false}

if on_ground
{
	if hsp >= frct                                       {hsp -= frct}
	if hsp <= -frct                                      {hsp += frct}
	if hsp > -frct && hsp < frct && move = 0             {hsp = 0}
}
if !on_ground
{
	if hsp >= air_frct                                   {hsp -= air_frct}
	if hsp <= -air_frct                                  {hsp += air_frct}
	if hsp > -air_frct && hsp < air_frct && move = 0     {hsp = 0}
}

vsp = vsp + grv

//Saut

if on_ground && key_jump && jump_cooldown = 0
{
	if sneak {vsp = -sneak_jumpforce}
	else {vsp = -normal_jumpforce}
	jump_cooldown = jump_cooldown_duration
}
if (!on_ground && vsp > 0 && doublejumped = 0 && !place_meeting(x, y+8, oCollision)) && key_jump && jump_cooldown = 0 && sneak = false
{
	vsp = -normal_doublejumpforce
	jump_cooldown = jump_cooldown_duration
	doublejumped = 1
}

if jump_cooldown > 0 {jump_cooldown -= 1}
if on_ground {doublejumped = 0}

//Collisions

if place_meeting(x+hsp, y, oCollision)
{
	while !place_meeting(x+sign(hsp), y, oCollision)
	{
		x = x + sign(hsp)
	}
	hsp = 0
}

if place_meeting(x, y+vsp, oCollision)
{
	while !place_meeting(x, y+sign(vsp), oCollision)
	{
		y = y + sign(vsp)
	}
	vsp = 0
}

//Exécution du mouvement

x = x + hsp
if jump_cooldown < jump_animation_duration || vsp >= 0 || doublejumped = true
{y = y + vsp}

//Animations

if key_left {dir = -1
	still_timer = 0}
if key_right {dir = 1
	still_timer = 0}

if !on_ground
{
	if sign(vsp) = -1
	{
		if sneak {if jump_cooldown = jump_cooldown_duration - 1
				  {if dir = 1 {sprite_index = sGabriel_sneak_jump_d}
				   if dir = -1 {sprite_index = sGabriel_sneak_jump_g}
				   if still_timer > still_cooldown_duration {sprite_index = sGabriel_sneak_jump_still}}
			      if jump_cooldown < jump_animation_duration
				  {if dir = 1 {sprite_index = sGabriel_sneak_air1_d}
				   if dir = -1 {sprite_index = sGabriel_sneak_air1_g}
				   if still_timer > still_cooldown_duration {sprite_index = sGabriel_sneak_air1_still}}}
		else {if jump_cooldown = jump_cooldown_duration - 1
			  {if doublejumped = 0
				  {if dir = 1 {sprite_index = sGabriel_jump_d}
				   if dir = -1 {sprite_index = sGabriel_jump_g}
			       if still_timer > still_cooldown_duration {sprite_index = sGabriel_jump_still}}
			   if doublejumped = 1
				  {if dir = 1 {sprite_index = sGabriel_jump_d}
				   if dir = -1 {sprite_index = sGabriel_jump_g}
			       if still_timer > still_cooldown_duration {sprite_index = sGabriel_doublejump_still}}}
		      if jump_cooldown < jump_animation_duration
			  {if dir = 1 {sprite_index = sGabriel_air1_d}
			   if dir = -1 {sprite_index = sGabriel_air1_g}
			   if still_timer > still_cooldown_duration {sprite_index = sGabriel_air1_still}}}
	}else
	{
		if sneak {if dir = 1 {sprite_index = sGabriel_sneak_air2_d}
				  if dir = -1 {sprite_index = sGabriel_sneak_air2_g}
				  if still_timer > still_cooldown_duration {sprite_index = sGabriel_sneak_air2_still}}
		else {if dir = 1 {sprite_index = sGabriel_air2_d}
			  if dir = -1 {sprite_index = sGabriel_air2_g}
			  if still_timer > still_cooldown_duration {sprite_index = sGabriel_air2_still}}
	}
}
if on_ground
{
	if hsp == 0
	{
		if sneak 
		{
			if dir = 1 {sprite_index = sGabriel_sneak_d}
			if dir = -1 {sprite_index = sGabriel_sneak_g}
			if still_timer > still_cooldown_duration {sprite_index = sGabriel_sneak_still}
		}
		else
		{
			still_timer ++
			if dir = 1 {sprite_index = sGabriel_d}
			if dir = -1 {sprite_index = sGabriel_g}
			if still_timer > still_cooldown_duration {sprite_index = sGabriel_still}
		}
	}else
	{
		still_timer = 0
		if sneak {if dir = 1 {sprite_index = sGabriel_sneak_r_d}
				  if dir = -1 {sprite_index = sGabriel_sneak_r_g}}
		else {if dir = 1 {sprite_index = sGabriel_r_d}
			  if dir = -1 {sprite_index = sGabriel_r_g}}
	}
	if sign(vsp) = -1
	{
		if sneak
		{if dir = 1 {sprite_index = sGabriel_sneak_jump_d}
		 if dir = -1 {sprite_index = sGabriel_sneak_jump_g}
		 if still_timer > still_cooldown_duration {sprite_index = sGabriel_sneak_jump_still}}
		else
		{if dir = 1 {sprite_index = sGabriel_jump_d}
		 if dir = -1 {sprite_index = sGabriel_jump_g}
		 if still_timer > still_cooldown_duration {sprite_index = sGabriel_jump_still}}
	}
}
image_speed = 1
show_debug_message(dir)