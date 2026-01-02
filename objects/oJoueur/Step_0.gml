if global.pause = 0 {

// Récupération des touches pressées

if !mort && state != "damage" && oCombat.state = "combat"
{
	if player = 1 && global.p1_controller = -1
	{
		key_left = keyboard_check(global.player1_key_left)
		key_right = keyboard_check(global.player1_key_right)
		key_jump = keyboard_check_pressed(global.player1_key_up)
		key_up = keyboard_check(global.player1_key_up)
		key_down = keyboard_check(global.player1_key_down)
		key_action_1 = keyboard_check_pressed(global.player1_key_action1)
		key_action_2 = keyboard_check_pressed(global.player1_key_action2)
		key_action_1_hold = keyboard_check(global.player1_key_action1)
		key_action_2_hold = keyboard_check(global.player1_key_action2)
		key_guard = keyboard_check(global.player1_key_guard)
	}
	if player = 2 && global.p2_controller = -1
	{
		key_left = keyboard_check(global.player2_key_left)
		key_right = keyboard_check(global.player2_key_right)
		key_jump = keyboard_check_pressed(global.player2_key_up)
		key_up = keyboard_check(global.player2_key_up)
		key_down = keyboard_check(global.player2_key_down)
		key_action_1 = keyboard_check_pressed(global.player2_key_action1)
		key_action_2 = keyboard_check_pressed(global.player2_key_action2)
		key_action_1_hold = keyboard_check(global.player2_key_action1)
		key_action_2_hold = keyboard_check(global.player2_key_action2)
		key_guard = keyboard_check(global.player2_key_guard)
	}
	if player = 1 && global.p1_controller != -1
	{
		var prev_key_up = key_up
		var gp_move_x = gamepad_axis_value(global.p1_controller, global.p1_gp_x_axis)
		var gp_move_y = gamepad_axis_value(global.p1_controller, global.p1_gp_y_axis)
		key_left = gp_move_x < -global.gp_deadzone
		key_right = gp_move_x > global.gp_deadzone
		if global.p1_gp_invert_y_axis
		{
			key_up = gp_move_y > global.gp_deadzone
			key_down = gp_move_y < -global.gp_deadzone
		}else{
			key_up = gp_move_y < -global.gp_deadzone
			key_down = gp_move_y > global.gp_deadzone
		}
		key_jump = (key_up && !prev_key_up) || gamepad_button_check_pressed(global.p1_controller, global.p1_gp_jump)
		key_action_1 = gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action1)
		key_action_2 = gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action2)
		key_action_1_hold = gamepad_button_check(global.p1_controller, global.p1_gp_action1)
		key_action_2_hold = gamepad_button_check(global.p1_controller, global.p1_gp_action2)
		key_guard = gamepad_button_check(global.p1_controller, global.p1_gp_guard)
	}
	if player = 2 && global.p2_controller != -1
	{
		var prev_key_up = key_up
		var gp_move_x = gamepad_axis_value(global.p2_controller, global.p2_gp_x_axis)
		var gp_move_y = gamepad_axis_value(global.p2_controller, global.p2_gp_y_axis)
		key_left = gp_move_x < -global.gp_deadzone
		key_right = gp_move_x > global.gp_deadzone
		if global.p2_gp_invert_y_axis
		{
			key_up = gp_move_y > global.gp_deadzone
			key_down = gp_move_y < -global.gp_deadzone
		}else{
			key_up = gp_move_y < -global.gp_deadzone
			key_down = gp_move_y > global.gp_deadzone
		}
		key_jump = (key_up && !prev_key_up) || gamepad_button_check_pressed(global.p2_controller, global.p2_gp_jump)
		key_action_1 = gamepad_button_check_pressed(global.p2_controller, global.p2_gp_action1)
		key_action_2 = gamepad_button_check_pressed(global.p2_controller, global.p2_gp_action2)
		key_action_1_hold = gamepad_button_check(global.p2_controller, global.p2_gp_action1)
		key_action_2_hold = gamepad_button_check(global.p2_controller, global.p2_gp_action2)
		key_guard = gamepad_button_check(global.p2_controller, global.p2_gp_guard)
	}
}
else
{
	key_left = 0
	key_right = 0
	key_jump = 0
	key_up = 0
	key_down = 0
	key_action_1 = 0
	key_action_2 = 0
	key_action_1_hold = 0
	key_action_2_hold = 0
	key_guard = 0
}

// Mouvement

if state = "neutral" {move = key_right - key_left}
else {move = 0}

// Est-ce que le joueur est sur le sol

time_since_on_ground ++
if place_meeting(x, y+1, oCollision) || (place_meeting(x, y+1, oPlateforme) && !place_meeting(x, y, oPlateforme) && !(key_down && state = "neutral")) //|| place_meeting(x, y+1, adv_inst)
     {on_ground = true
	  time_since_on_ground = 0}
else {on_ground = false}

// Sneak on/off

if state = "neutral"
{
	if key_down && on_ground && !place_meeting(x, y+1, oPlateforme) && (sneak || state = "neutral")
	{sneak = true}
	else if !place_meeting(x, y-sneak_pixel_difference, oCollision)
	{sneak = false}
}
if state = "damage" && !place_meeting(x, y-sneak_pixel_difference, oCollision) {sneak = false}

// Vitesse et déplacement en sneak / pas en sneak

if state = "neutral"
{
	if on_ground {walk_acc = ground_walk_acc}
	else {walk_acc = air_walk_acc}

	if sneak {if abs(hsp+(move*sneak_acc)) <= max_sneaksp || (!on_ground && abs(hsp+(move*walk_acc)) <= max_walksp)
		{hsp += move * sneak_acc}
		else {if on_ground {hsp = max_sneaksp * sign(hsp)}
			  else {hsp = max_walksp * sign(hsp)}}}

	if !sneak {if abs(hsp+(move*walk_acc)) <= max_walksp
		{hsp += move * walk_acc}
		else {hsp = max_walksp * sign(hsp)}}
}

// Gravité

if key_down {grv = key_down_grv}
else {grv = normal_grv}

// Frottements

if on_ground
{
	if state = "atk_dash_startup" || state = "atk_dash_active" || state = "atk_dash_recovery" {frct = dash_frct}
	else {frct = ground_frct}
}
else {frct = air_frct}

if hsp >= frct                                       {hsp -= frct}
if hsp <= -frct                                      {hsp += frct}
if hsp > -frct && hsp < frct && move = 0             {hsp = 0}

// Application de la gravité

vsp = vsp + grv

// Saut

if on_ground {has_jumped = false}

if (on_ground || (time_since_on_ground <= jump_cheat_time && vsp >= 0 && !has_jumped)) && key_jump && state = "neutral" && !sneak && !key_down
{
	vsp = -jumpforce
	has_jumped = true
}

// Collisions avec l'adversaire

if place_meeting(x+hsp, y, adv_inst)
{
	if (key_left && x>adv_inst.x) || (key_right && x<adv_inst.x)
	{
		hsp = dir*push_force/adv_inst.push_force
		adv_inst.pushed_force += hsp
	}
	if place_meeting(x+hsp, y, adv_inst)
	{
		while !place_meeting(x + sign(hsp)*collision_step, y, adv_inst)
		{
			x = x + sign(hsp) * collision_step
		}
		hsp = 0
	}
}

hsp += pushed_force

if place_meeting(x, y+vsp, adv_inst)
{
	while !place_meeting(x, y + sign(vsp)*collision_step, adv_inst)
	{
		y = y + sign(vsp) * collision_step
	}
	vsp = 0
	if y < adv_inst.y {vsp = -normal_headbounceforce}
}

if place_meeting(x, y, adv_inst)
{hsp -= sign(adv_inst.x-x)}

// Collisions avec le sol et les murs

if place_meeting(x+hsp, y, oCollision)
{
	while !place_meeting(x + sign(hsp)*collision_step, y, oCollision) && !place_meeting(x, y, oCollision)
	{
		x = x + sign(hsp) * collision_step
	}
	hsp = 0
}

if place_meeting(x, y+vsp, oCollision)
{
	while !place_meeting(x, y + sign(vsp)*collision_step, oCollision) && !place_meeting(x, y, oCollision)
	{
		y = y + sign(vsp) * collision_step
	}
	vsp = 0
}

var inst_coll = instance_place(x, y, oCollision)
if inst_coll != noone
{hsp -= sign(inst_coll.x-x)}

if place_meeting(x, y, adv_inst)
{hsp -= sign(adv_inst.x-x)}

// Collisions avec les plateformes

if place_meeting(x, y+vsp, oPlateforme) && vsp > 0 && !place_meeting(x, y, oPlateforme) && !(key_down && state = "neutral") && !(atk_downair_type = "pierce" && (state = "atk_downair_startup" || state = "atk_downair_active" || state = "atk_downair_recovery"))
{
	while !place_meeting(x, y + sign(vsp)*collision_step, oPlateforme)
	{
		y = y + sign(vsp) * collision_step
	}
	vsp = 0
}

// Cap de vitesse verticale

if vsp < -jumpforce {vsp = -jumpforce}

// Exécution du mouvement

x = x + hsp
y = y + vsp

hsp -= pushed_force
pushed_force = 0

if on_ground {y = round(y)}

// Etablir la direction du personnage

if state = "neutral"
{
	if key_left {dir = -1}
	if key_right {dir = 1}
}

// Dégats et capacité d'attaquer

if dmg_timer = 0 && state = "damage" {state = "neutral"}
if dmg_timer > 0 {state = "damage"
	dmg_timer --}

// Résurrection

if mort && (vies != 0 || global.ruleset_style != "vies") && resurrect_timer >= resurrect_cooldown
{
	mort = false
	state = "neutral"
	pv = max_pv
	dmg_timer = 72
}
resurrect_timer	++

// Collisions avec un projectile

var projectiles = []

with oProjectile
{
	if other.own_hitbox.inst_collision(other.x, other.y, id) && actif && (expediteur != other.id || friendly_fire)
	{array_push(projectiles, id)}
}

for (var i = 0; i < array_length(projectiles); i++)
{
	var projectile = projectiles[i]
	
	damage(projectile.degats, projectile.dmg_duration, projectile.h_knockback*sign(x-projectile.x), projectile.v_knockback)
	
	if projectile.type = "boomerang" || projectile.type = "straight"
	{projectile.actif = false}
}

// Collisions avec une Atk_box

var touched_boxes = []

with oAtk_box
{
	if other.own_hitbox.inst_collision(other.x, other.y, id) && actif && owner != other.id
	{array_push(touched_boxes, id)}
}

for (var i = 0; i < array_length(touched_boxes); i++)
{
	var touched_box = touched_boxes[i]
	
	touched_box.touched = true
	damage(touched_box.degats, touched_box.dmg_duration, touched_box.h_knockback*touched_box.atk_dir, touched_box.v_knockback)
}

// Attaques

attack_timer ++

if is_string(atk()) {show_debug_message("p"+string(player)+" "+atk())} // Debug

// Atk_b

if atk() = "atk_b" && state = "neutral"
{
	if atk_b_type = "pierce"
	{
		atk_b_box_inst = instance_create_layer(x, y, "Player", oAtk_box,
		{
			sprite_index : atk_b_box_sprite,
			owner : id,
			x_pos : atk_b_base_x_pos*dir,
			y_pos : atk_b_base_y_pos + sneak*sneak_pixel_difference,
			degats : atk_b_degats,
			dmg_duration : atk_b_dmg_duration,
			h_knockback : atk_b_h_knockback,
			v_knockback : atk_b_v_knockback,
			actif : false,
			atk_dir : dir
		})
	}
	
	state = "atk_b_startup"
	attack_timer = 0
}

if state = "atk_b_startup"
{
	if attack_timer >= atk_b_startup_time
	{
		state = "atk_b_active"
		attack_timer = 0
	}
}

if state = "atk_b_active"
{
	if atk_b_type = "pierce"
	{
		if attack_timer < atk_b_active_time/2
		{atk_b_box_inst.x_pos += 2*dir*atk_b_portee_suppl_x/atk_b_active_time}
		if attack_timer > atk_b_active_time/2
		{atk_b_box_inst.x_pos -= 2*dir*atk_b_portee_suppl_x/atk_b_active_time}
	}
	
	if attack_timer >= atk_b_active_time
	{
		state = "atk_b_recovery"
		attack_timer = 0
	}
}

if state = "atk_b_recovery"
{
	if attack_timer >= atk_b_recovery_time
	{
		state = "neutral"
		
		if atk_b_type = "pierce"
		{
			instance_destroy(atk_b_box_inst)
			atk_b_box_inst = -1
		}
	}
}

// Atk_dash

if atk() = "atk_dash" && state = "neutral"
{
	if atk_dash_type = "pierce"
	{
		atk_dash_box_inst = instance_create_layer(x, y, "Player", oAtk_box,
		{
			sprite_index : atk_dash_box_sprite,
			owner : id,
			x_pos : atk_dash_base_x_pos*dir,
			y_pos : atk_dash_base_y_pos + sneak*sneak_pixel_difference,
			degats : atk_dash_degats,
			dmg_duration : atk_dash_dmg_duration,
			h_knockback : atk_dash_h_knockback,
			v_knockback : atk_dash_v_knockback,
			actif : false,
			atk_dir : dir
		})
	}
	
	state = "atk_dash_startup"
	attack_timer = 0
}

if state = "atk_dash_startup"
{
	if attack_timer >= atk_dash_startup_time
	{
		state = "atk_dash_active"
		attack_timer = 0
	}
}

if state = "atk_dash_active"
{
	if atk_dash_type = "pierce"
	{
		if attack_timer < atk_dash_active_time/2
		{atk_dash_box_inst.x_pos += 2*dir*atk_dash_portee_suppl_x/atk_dash_active_time}
		if attack_timer > atk_dash_active_time/2
		{atk_dash_box_inst.x_pos -= 2*dir*atk_dash_portee_suppl_x/atk_dash_active_time}
	}
	
	if attack_timer >= atk_dash_active_time
	{
		state = "atk_dash_recovery"
		attack_timer = 0
	}
}

if state = "atk_dash_recovery"
{
	if attack_timer >= atk_dash_recovery_time
	{
		state = "neutral"
		
		if atk_dash_type = "pierce"
		{
			instance_destroy(atk_dash_box_inst)
			atk_dash_box_inst = -1
		}
	}
}

// Atk_up

if atk() = "atk_up" && state = "neutral"
{
	if atk_up_type = "pierce"
	{
		atk_up_box_inst = instance_create_layer(x, y, "Player", oAtk_box,
		{
			sprite_index : atk_up_box_sprite,
			owner : id,
			x_pos : atk_up_base_x_pos*dir,
			y_pos : atk_up_base_y_pos + sneak*sneak_pixel_difference,
			degats : atk_up_degats,
			dmg_duration : atk_up_dmg_duration,
			h_knockback : atk_up_h_knockback,
			v_knockback : atk_up_v_knockback,
			actif : false,
			atk_dir : dir
		})
	}
	
	state = "atk_up_startup"
	attack_timer = 0
}

if state = "atk_up_startup"
{
	if attack_timer >= atk_up_startup_time
	{
		state = "atk_up_active"
		attack_timer = 0
	}
}

if state = "atk_up_active"
{
	if atk_up_type = "pierce"
	{
		if attack_timer < atk_up_active_time/2
		{atk_up_box_inst.y_pos -= 2*atk_up_portee_suppl_y/atk_up_active_time}
		if attack_timer > atk_up_active_time/2
		{atk_up_box_inst.y_pos += 2*atk_up_portee_suppl_y/atk_up_active_time}
	}
	
	if attack_timer >= atk_up_active_time
	{
		state = "atk_up_recovery"
		attack_timer = 0
	}
}

if state = "atk_up_recovery"
{
	if attack_timer >= atk_up_recovery_time
	{
		state = "neutral"
		
		if atk_up_type = "pierce"
		{
			instance_destroy(atk_up_box_inst)
			atk_up_box_inst = -1
		}
	}
}

// Atk_downair

if atk() = "atk_downair" && state = "neutral"
{
	if atk_downair_type = "pierce"
	{
		atk_downair_box_inst = instance_create_layer(x, y, "Player", oAtk_box,
		{
			sprite_index : atk_downair_box_sprite,
			owner : id,
			x_pos : atk_downair_base_x_pos*dir,
			y_pos : atk_downair_base_y_pos + sneak*sneak_pixel_difference,
			degats : atk_downair_degats,
			dmg_duration : atk_downair_dmg_duration,
			h_knockback : atk_downair_h_knockback,
			v_knockback : atk_downair_v_knockback,
			actif : false,
			atk_dir : dir
		})
	}
	
	state = "atk_downair_startup"
	attack_timer = 0
}

if state = "atk_downair_startup"
{
	if attack_timer >= atk_downair_startup_time
	{
		state = "atk_downair_active"
		attack_timer = 0
	}
}

if state = "atk_downair_active"
{
	if atk_downair_type = "pierce"
	{
		if attack_timer < atk_downair_active_time/3
		{atk_downair_box_inst.y_pos += 3*atk_downair_portee_suppl_y/atk_downair_active_time}
	}
	
	if attack_timer >= atk_downair_active_time
	{
		state = "atk_downair_recovery"
		attack_timer = 0
	}
}

if state = "atk_downair_recovery"
{
	if attack_timer >= atk_downair_recovery_time
	{
		state = "neutral"
		
		if atk_downair_type = "pierce"
		{
			instance_destroy(atk_downair_box_inst)
			atk_downair_box_inst = -1
		}
	}
}

// Atk_sideair

if atk() = "atk_sideair" && state = "neutral"
{
	if atk_sideair_type = "pierce"
	{
		atk_sideair_box_inst = instance_create_layer(x, y, "Player", oAtk_box,
		{
			sprite_index : atk_sideair_box_sprite,
			owner : id,
			x_pos : atk_sideair_base_x_pos*dir,
			y_pos : atk_sideair_base_y_pos + sneak*sneak_pixel_difference,
			degats : atk_sideair_degats,
			dmg_duration : atk_sideair_dmg_duration,
			h_knockback : atk_sideair_h_knockback,
			v_knockback : atk_sideair_v_knockback,
			actif : false,
			atk_dir : dir
		})
	}
	
	state = "atk_sideair_startup"
	attack_timer = 0
}

if state = "atk_sideair_startup"
{
	if attack_timer >= atk_sideair_startup_time
	{
		state = "atk_sideair_active"
		attack_timer = 0
	}
}

if state = "atk_sideair_active"
{
	if atk_sideair_type = "pierce"
	{
		if attack_timer < atk_sideair_active_time/2
		{atk_sideair_box_inst.x_pos += 2*dir*atk_sideair_portee_suppl_x/atk_sideair_active_time}
		if attack_timer > atk_dash_active_time/2
		{atk_sideair_box_inst.x_pos -= 2*dir*atk_sideair_portee_suppl_x/atk_sideair_active_time}
	}
	
	if attack_timer >= atk_sideair_active_time
	{
		state = "atk_sideair_recovery"
		attack_timer = 0
	}
}

if state = "atk_sideair_recovery"
{
	if attack_timer >= atk_sideair_recovery_time
	{
		state = "neutral"
		
		if atk_sideair_type = "pierce"
		{
			instance_destroy(atk_sideair_box_inst)
			atk_sideair_box_inst = -1
		}
	}
}

// Spe_b

if atk() = "spe_b" && state = "neutral"
{
	if spe_b_type = "mitr_chb"
	{
		spe_b_box_inst = instance_create_layer(x+dir*hand_x_pos, y-hand_height, "Player", oMouv_spe_b_feuille,
		{
			owner : id,
			relative_x_pos : hand_x_pos,
			relative_y_pos : -hand_height
		})
		spe_b_chg_time = 0
	}
	
	state = "spe_b_startup"
	attack_timer = 0
}

if state = "spe_b_startup"
{	
	if attack_timer >= spe_b_startup_time
	{
		state = "spe_b_active"
		attack_timer = 0
	}
	
	if spe_b_type = "mitr_chb"
	{
		if key_action_2_hold
		{
			state = "spe_b_startup"
			attack_timer = 0
			spe_b_chg_time ++
		}
	}
}

if state = "spe_b_active"
{
	if spe_b_type = "mitr_chb"
	{
		var projectile_tier = 1
		if spe_b_chg_time >= spe_b_proj_t2_chg_time {projectile_tier = 2}
		if spe_b_chg_time >= spe_b_proj_t3_chg_time {projectile_tier = 3}
		if spe_b_chg_time >= spe_b_proj_t4_chg_time {projectile_tier = 4}
		
		spe_b_box_inst.shoot(projectile_tier, dir)
	}
	
	if attack_timer >= spe_b_active_time
	{
		state = "spe_b_recovery"
		attack_timer = 0
	}
}

if state = "spe_b_recovery"
{
	if spe_b_type = "mitr_chb"
	{
		if key_action_2_hold
		{
			state = "spe_b_startup"
			attack_timer = 0
			spe_b_chg_time = 0
		}
	}
	
	if attack_timer >= spe_b_recovery_time
	{
		state = "neutral"
		
		if spe_b_type = "mitr_chb"
		{
			instance_destroy(spe_b_box_inst)
			spe_b_box_inst = -1
			spe_b_chg_time = 0
		}
	}
}

// Spe_side

if spe_side_type = "boomerang"
{n_projectiles_spe_side = projectile_nb_check(oProjectile, boomerang_sprite, id)}

if atk() = "spe_side" && state = "neutral"
{
	if spe_side_type = "boomerang"
	{
		if n_projectiles_spe_side >= n_max_projectiles_spe_side
		{
			state = "neutral"
		}
	}
	
	state = "spe_side_startup"
	attack_timer = 0
}

if state = "spe_side_startup"
{
	if spe_side_type = "boomerang"
	{
		if dir = 1
		{
			if key_up {angle = boomerang_angle}
			else if key_down {angle = -boomerang_angle}
			else {angle = 0}
		}
		if dir = -1
		{
			if key_up {angle = pi-boomerang_angle}
			else if key_down {angle = pi+boomerang_angle}
			else {angle = pi}
		}
	}
	
	if attack_timer >= spe_side_startup_time
	{
		state = "spe_side_active"
		attack_timer = 0
	}
}

if state = "spe_side_active"
{
	if spe_side_type = "boomerang"
	{
		if move = sign(hsp)
		{
			added_speed = abs(hsp)
			added_portee = boomerang_coefficient_portee_bonus * abs(hsp)
		}else{
			added_speed = 0
			added_portee = 0
		}
		instance_create_layer(x, y-hand_height, "Player", oProjectile,
		{
			type : "boomerang",
			expediteur: id,
			friendly_fire : false,
			sprite_index: boomerang_sprite,
			degats : boomerang_degats,
			dmg_duration : boomerang_dmg_duration,
			h_knockback : boomerang_h_knockback,
			v_knockback : boomerang_v_knockback,
			actif : true,
			
			rotation_sp : boomerang_rotation_sp,
			angle : angle,
			portee : boomerang_portee + added_portee,
			vitesse : boomerang_sp + added_speed,
			temps_acc_retour : boomerang_comeback_acc_time,
		})
	}
	
	if attack_timer >= spe_side_active_time
	{
		state = "spe_side_recovery"
		attack_timer = 0
	}
}

if state = "spe_side_recovery"
{
	if attack_timer >= spe_side_recovery_time
	{
		state = "neutral"
	}
}



}