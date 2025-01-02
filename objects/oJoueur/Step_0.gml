//Récupération des touches pressées

if mort = false
{
	if player = 1
	{
		key_left = keyboard_check(global.player1_key_left)
		key_right = keyboard_check(global.player1_key_right)
		key_jump = keyboard_check_pressed(global.player1_key_jump)
		key_sneak = keyboard_check(global.player1_key_sneak)
		key_action_1 = keyboard_check_pressed(global.player1_key_action1)
		key_action_2 = keyboard_check_pressed(global.player1_key_action2)
	}
	if player = 2
	{
		key_left = keyboard_check(global.player2_key_left)
		key_right = keyboard_check(global.player2_key_right)
		key_jump = keyboard_check_pressed(global.player2_key_jump)
		key_sneak = keyboard_check(global.player2_key_sneak)
		key_action_1 = keyboard_check_pressed(global.player2_key_action1)
		key_action_2 = keyboard_check_pressed(global.player2_key_action2)
	}
}

//Mouvement

move = key_right - key_left

//Sneak on/off

if key_sneak {sneak = true}
if !key_sneak && !place_meeting(x, y-sneak_pixel_difference, oCollision)
{sneak = false}

//Vitesse et gravité en sneak / pas en sneak

if sneak {if abs(hsp+(move*sneaksp)) <= max_sneaksp
	{hsp += move * sneaksp}
	else {hsp = max_sneaksp * sign(hsp)}
	grv = sneak_grv}

if !sneak {if abs(hsp+(move*walksp)) <= max_walksp
	{hsp += move * walksp}
	else {hsp = max_walksp * sign(hsp)}
	grv = normal_grv}
	
//Est-ce que le joueur est sur le sol

if place_meeting(x, y+1, oCollision)
     {on_ground = true}
else {on_ground = false}

//Frottements différents dans l'air et sur le sol

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

//Application de la gravité

vsp = vsp + grv

//Saut

if on_ground {jumpcount = 0}

if on_ground && key_jump
{
	if sneak {vsp = -sneak_jumpforce}
	else {vsp = -normal_jumpforce}
	jumpcount += 1
}
if (!on_ground && vsp > 0 && jumpcount > 0 && jumpcount < max_jump_amount && !place_meeting(x, y+8, oCollision)) && key_jump && sneak = false
{
	vsp = -normal_doublejumpforce
	jumpcount += 1
}

// Pousser l'adversaire

/*if place_meeting(x+hsp, y, adv_inst)
{
	with adv_inst
	{
		if !place_meeting(x+other.hsp*other.push_force/push_force, y, oCollision)
		{global.push_possible = true}
		else {global.push_possible = false}
	}
	if place_meeting(x+hsp*push_force/adv_inst.push_force, y, oCollision)
	{global.push_possible = false}
	if global.push_possible
	{
		x += hsp*push_force/adv_inst.push_force
		adv_inst.x += hsp*push_force/adv_inst.push_force
	}
	hsp = 0
}*/

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
		while !place_meeting(x+sign(hsp), y, adv_inst)
		{
			x = x + sign(hsp)
		}
		hsp = 0
	}
}

if place_meeting(x, y+vsp, adv_inst)
{
	while !place_meeting(x, y+sign(vsp), adv_inst)
	{
		y = y + sign(vsp)
	}
	vsp = 0
	//hsp -= sign(adv_inst.x-x)*facteur_repulsion
}

if place_meeting(x, y, adv_inst)
{hsp -= sign(adv_inst.x-x)}

// Collisions avec le sol et les murs

if place_meeting(x+hsp, y, oCollision)
{
	while !place_meeting(x+sign(hsp), y, oCollision) && !place_meeting(x, y, oCollision)
	{
		x = x + sign(hsp)
	}
	hsp = 0
}

if place_meeting(x, y+vsp, oCollision)
{
	while !place_meeting(x, y+sign(vsp), oCollision) && !place_meeting(x, y, oCollision)
	{
		y = y + sign(vsp)
	}
	vsp = 0
}

var inst_coll = instance_place(x, y, oCollision)
if inst_coll != noone
{hsp -= sign(inst_coll.x-x)
	}

// Exécution du mouvement

x = x + hsp
y = y + vsp

// Etablir la direction du personnage

if key_left {dir = -1
	still_timer = 0}
if key_right {dir = 1
	still_timer = 0}

still_timer++
if still_timer >= still_cooldown_duration {dir = 0}

// Mort

if pv <= 0 && !mort_fin
{
	vies -= 1
	pv = max_pv
}
if global.ruleset_style = "vies" && vies = 0
{
	mort = true
	mort_fin = true
	pv = 0
}

// Collisions avec un projectile

var collisions = []

with (oProjectile)
{
	if (expediteur != other.id || friendly_fire) && place_meeting(x, y, other.own_hitbox)
	{array_push(collisions, id)}
}

for (var i = 0; i < array_length(collisions); i++)
{
	var projectile = collisions[i]
	
	if projectile.type = "boomerang" && projectile.actif = true
	{
		hsp += projectile.recul_hsp*sign(projectile.hsp)
		pv -= projectile.degats
		if projectile.retour = 0 {projectile.retour = 1}
		projectile.actif = false
	}
}

// Attaque boomerang

if has_boomerang
{
	n_boomerang = projectile_nb_check(oProjectile, sBoomerang, id)
	
	if key_action_1 && (key_left || key_right || hsp != 0)
	{
		if (n_boomerang < n_max_boomerang)
		{
			if move = sign(hsp) {added_initial_hsp = hsp}
			else {added_initial_hsp = 0}
			instance_create_layer(x, y-hand_height, "Player", oProjectile,
			{
				type : "boomerang",
				expediteur: id,
				friendly_fire : false,
				sprite_index: sBoomerang,
				portee : dir*boomerang_portee,
				vitesse : dir*boomerang_sp + added_initial_hsp,
				temps_acc_retour : boomerang_comeback_acc_time,
				degats : boomerang_dmg,
				recul_hsp : boomerang_recul_hsp
			})
		}
	}
}