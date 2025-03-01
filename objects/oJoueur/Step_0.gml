if global.pause = 0 {

// Récupération des touches pressées

if !mort && !mort_fin && state != "damage"
{
	if player = 1
	{
		key_left = keyboard_check(global.player1_key_left)
		key_right = keyboard_check(global.player1_key_right)
		key_jump = keyboard_check_pressed(global.player1_key_up)
		key_up = keyboard_check(global.player1_key_up)
		key_down = keyboard_check(global.player1_key_down)
		key_action_1 = keyboard_check_pressed(global.player1_key_action1)
		key_action_2 = keyboard_check_pressed(global.player1_key_action2)
	}
	if player = 2
	{
		key_left = keyboard_check(global.player2_key_left)
		key_right = keyboard_check(global.player2_key_right)
		key_jump = keyboard_check_pressed(global.player2_key_up)
		key_up = keyboard_check(global.player2_key_up)
		key_down = keyboard_check(global.player2_key_down)
		key_action_1 = keyboard_check_pressed(global.player2_key_action1)
		key_action_2 = keyboard_check_pressed(global.player2_key_action2)
	}
}
else 
{
	key_left = false
	key_right = false
	key_jump = false
	key_up = false
	key_down = false
	key_action_1 = false
	key_action_2 = false
}

// Mouvement

if state = "neutral" {move = key_right - key_left}
else {move = 0}

// Est-ce que le joueur est sur le sol

time_since_on_ground ++

if place_meeting(x, y+1, oCollision) || (place_meeting(x, y+1, oPlateforme) && !place_meeting(x, y, oPlateforme) && (!key_down || state = "boomerang"))
     {on_ground = true
	  time_since_on_ground = 0}
else {on_ground = false}

// Sneak on/off

if key_down && on_ground && !place_meeting(x, y+1, oPlateforme) && (sneak || state = "neutral")
{sneak = true}
else if !place_meeting(x, y-sneak_pixel_difference, oCollision)
{sneak = false}

// Vitesse et déplacement en sneak / pas en sneak

if on_ground {walk_acc = ground_walk_acc}
else {walk_acc = air_walk_acc}

if sneak {if abs(hsp+(move*sneak_acc)) <= max_sneaksp || (!on_ground && abs(hsp+(move*walk_acc)) <= max_walksp)
	{hsp += move * sneak_acc}
	else {if on_ground {hsp = max_sneaksp * sign(hsp)}
		  else {hsp = max_walksp * sign(hsp)}}}

if !sneak {if abs(hsp+(move*walk_acc)) <= max_walksp
	{hsp += move * walk_acc}
	else {hsp = max_walksp * sign(hsp)}}

// Gravité

if key_down {grv = key_down_grv}
else {grv = normal_grv}

// Frottements différents dans l'air et sur le sol

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

// Application de la gravité

vsp = vsp + grv

// Saut

if on_ground {doublejump_count = 0
			  has_jumped = false}

if (on_ground || (time_since_on_ground <= jump_cheat_time && vsp >= 0 && !has_jumped)) && key_jump && state = "neutral"
{
	if sneak || key_down {vsp = -sneak_jumpforce}
	else {vsp = -normal_jumpforce}
	has_jumped = true
}
else if !on_ground && vsp > 0 && doublejump_count < max_doublejump_amount && !place_meeting(x, y+min_doublejump_height, oCollision) && key_jump && !key_down && !sneak && state = "neutral"
{
	vsp = -normal_doublejumpforce
	doublejump_count += 1
	if player = 1 {oCombat.p1_doublejumping = true}
	if player = 2 {oCombat.p2_doublejumping = true}
}

// Collisions avec l'adversaire

if place_meeting(x+hsp, y, adv_inst)
{
	if (key_left && x>adv_inst.x) || (key_right && x<adv_inst.x)
	{
		with adv_inst
		{
			if !place_meeting(x+other.hsp*other.push_force/push_force, y, oCollision)
			{other.push_possible = 1}
			else {other.push_possible = 0}
		}
		if push_possible = 1
		{
			hsp = hsp*push_force/adv_inst.push_force/2
			adv_inst.x += hsp
		}
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

if place_meeting(x, y+vsp, adv_inst)
{
	while !place_meeting(x, y + sign(vsp)*collision_step, adv_inst)
	{
		y = y + sign(vsp) * collision_step
	}
	vsp = 0
	//hsp -= sign(adv_inst.x-x)*facteur_repulsion
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

if place_meeting(x, y+vsp, oPlateforme) && vsp > 0 && !place_meeting(x, y, oPlateforme) && (!key_down || state = "boomerang")
{
	while !place_meeting(x, y + sign(vsp)*collision_step, oPlateforme)
	{
		y = y + sign(vsp) * collision_step
	}
	vsp = 0
}

// Exécution du mouvement

x = x + hsp
y = y + vsp

if on_ground {y = round(y)}

// Etablir la direction du personnage

if state = "neutral"
{
	if key_left {dir = -1
		still_timer = 0
		still = false}
	if key_right {dir = 1
		still_timer = 0
		still = false}
}

still_timer++
if still_timer >= still_cooldown_duration {still = true}

// Dégats et capacité d'attaquer

dmg_timer ++
if dmg_timer = dmg_cooldown_to_neutral
{state = "neutral"}
if dmg_timer < dmg_cooldown_to_neutral
{state = "damage"}

// Résurrection

if mort && !mort_fin && resurrect_timer >= resurrect_cooldown
{
	mort = false
	state = "neutral"
	pv = max_pv
}
resurrect_timer	++

// Collisions avec un projectile

var collisions = []

with (oProjectile)
{
	if (expediteur != other.id || friendly_fire) && place_meeting(x, y, other.id)
	{array_push(collisions, id)}
}

for (var i = 0; i < array_length(collisions); i++)
{
	var projectile = collisions[i]
	
	if projectile.type = "boomerang" && projectile.actif = true
	{
		damage(projectile.degats, projectile.h_knockback, projectile.v_knockback)
		projectile.actif = false
	}
}

// Attaques

attack_timer ++

// Attaque boomerang

if has_boomerang
{
	n_boomerang = projectile_nb_check(oProjectile, sGab_boomerang, id)
	
	if key_action_2 && (key_left || key_right || hsp != 0) && state = "neutral" && n_boomerang < n_max_boomerang
	{
		state = "boomerang"
		attack_timer = 0
		if dir = 1 {angle = 0}
		if dir = -1 {angle = pi}
	}
}

if state = "boomerang" && attack_timer <= boomerang_attack_timer && (key_up || key_down)
{
	if dir = 1
	{
		if key_up {angle = boomerang_angle}
		if key_down {angle = -boomerang_angle}
	}
	if dir = -1
	{
		if key_up {angle = pi-boomerang_angle}
		if key_down {angle = pi+boomerang_angle}
	}
}

if state = "boomerang" && attack_timer = boomerang_move_timer && state != "damage"
{state = "neutral"}

if state = "boomerang" && attack_timer = boomerang_attack_timer
{
	if move = sign(hsp)
	{
		added_speed = abs(hsp)
		added_portee = boomerang_coefficient_portee_bonus * abs(hsp)
	}
	else
	{
		added_speed = 0
		added_portee = 0
	}
	instance_create_layer(x, y-hand_height, "Player", oProjectile,
	{
		type : "boomerang",
		expediteur: id,
		friendly_fire : false,
		sprite_index: boomerang_sprite,
		rotation_sp : boomerang_rotation_sp,
		angle : angle,
		portee : boomerang_portee + added_portee,
		vitesse : boomerang_sp + added_speed,
		temps_acc_retour : boomerang_comeback_acc_time,
		degats : boomerang_dmg,
		h_knockback : 0,
		v_knockback : 0
	})
}

}