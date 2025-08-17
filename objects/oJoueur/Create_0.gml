// Initialisation des variables 

state = "neutral"

hsp = 0
vsp = 0
sneak = false
on_ground = true
has_jumped = false
time_since_on_ground = 0
doublejump_count = 0
pushed_force = 0
if player = 1 {dir = 1}
if player = 2 {dir = -1}

// Initialisation des réglages par défaut

ground_walk_acc = 0.7
air_walk_acc = 0.25
walk_acc = ground_walk_acc
max_walksp = 4
normal_jumpforce = 8.5
normal_doublejumpforce = 6.5
jump_cheat_time = 4

sneak_acc = 0.4
max_sneaksp = 1.5 // doit être plus petit que min_sideatk_speed et que min_dash_speed
sneak_jumpforce = 6

sneak_pixel_difference = 20
max_doublejump_amount = 1
min_doublejump_height = 8

ground_frct = 0.3
dash_frct = 0.15
air_frct = 0.025
frct = ground_frct

normal_grv = 0.3
key_down_grv = 0.5
grv = normal_grv

push_force = 1
facteur_repulsion = 0.1
collision_step = 0.1

// Initialisation des attaques

attack_timer = 0

min_sideatk_speed = 1.6 // doit être plus grand que max_sneaksp
min_dash_speed = 3.7 // doit être plus grand que max_sneaksp

// Atk_b
atk_b_type = 0
atk_b_startup_time = 0
atk_b_active_time = 0
atk_b_recovery_time = 0
atk_b_box_inst = -1

// Atk_dash
atk_dash_type = 0
atk_dash_startup_time = 0
atk_dash_active_time = 0
atk_dash_recovery_time = 0
atk_dash_box_inst = -1

// Atk_up
atk_up_type = 0
atk_up_startup_time = 0
atk_up_active_time = 0
atk_up_recovery_time = 0

// Atk_downair
atk_downair_type = 0
atk_downair_startup_time = 0
atk_downair_active_time = 0
atk_downair_recovery_time = 0

// Atk_sideair
atk_sideair_type = 0
atk_sideair_startup_time = 0
atk_sideair_active_time = 0
atk_sideair_recovery_time = 0

// Spe_b
spe_b_type = 0
spe_b_startup_time = 0
spe_b_active_time = 0
spe_b_recovery_time = 0

// Spe_side
spe_side_type = 0
spe_side_startup_time = 0
spe_side_active_time = 0
spe_side_recovery_time = 0

n_max_projectiles_spe_side = 0

// Spe_up
spe_up_type = 0
spe_up_startup_time = 0
spe_up_active_time = 0
spe_up_recovery_time = 0

// Spe_down
spe_down_type = 0
spe_down_startup_time = 0
spe_down_active_time = 0
spe_down_recovery_time = 0

// Initialisation de la vie et du timer

if global.ruleset_style = "vies"
{
	vies = global.ruleset_vies
}
if global.ruleset_style = "temps"
{
	vies = 0
}

max_pv = 100
pv = max_pv

dmg_timer = 0

mort = false

resurrect_timer = 0
resurrect_cooldown = 60

// Fonction dégats

function damage(pv_loss, dmg_duration, h_knockback, v_knockback)
{
	if dmg_timer = 0 && !mort
	{
		// Dégats si on ne meurt pas
		if pv-pv_loss > 0
		{pv -= pv_loss}
		// Dégats si on meurt
		else if pv-pv_loss <= 0
		{
			pv = 0
			vies -= 1
			mort = true
			resurrect_timer = 0
		}
		// Score
		if player = 1 {global.p1_dmg_taken += pv_loss}
		if player = 2 {global.p2_dmg_taken += pv_loss}
		// Recul
		hsp += h_knockback
		vsp += v_knockback
		// Reset le cooldown de dégats
		dmg_timer = dmg_duration
		// Suppression des box d'attaque en cours quand on prend un coup
		if state != "neutral"
		{
			if atk_b_box_inst != -1
			{
				instance_destroy(atk_b_box_inst)
				atk_b_box_inst = -1
			}
			if atk_dash_box_inst != -1
			{
				instance_destroy(atk_dash_box_inst)
				atk_dash_box_inst = -1
			}
		}
		// État de dégats
		state = "damage"
	}
	// Mort finale (plus de vies)
	if global.ruleset_style = "vies" && vies = 0
	{
		mort_fin = true
	}
}

// Fonction attaque

function atk()
{
	if state = "neutral"
	{
		if key_action_2
		{
			if key_up 
			{return "spe_up"}
			if key_down && !key_left && !key_right 
			{return "spe_down"}
			if key_left || key_right || abs(hsp) >= min_sideatk_speed 
			{return "spe_side"}
			return "spe_b"
		}
		if key_action_1
		{
			if key_up && !key_left && !key_right
			{return "atk_up"}
			if key_down && !on_ground
			{return "atk_downair"}
			if !on_ground && abs(hsp) >= min_sideatk_speed
			{return "atk_sideair"}
			if on_ground && abs(hsp) >= min_dash_speed
			{return "atk_dash"}
			return "atk_b"
		}
	}
}
function atk_charge()
{
	if state = "neutral"
	{
		if key_action_2_hold
		{
			if key_up 
			{return "spe_up"}
			if key_down && !key_left && !key_right 
			{return "spe_down"}
			if key_left || key_right || abs(hsp) >= min_sideatk_speed 
			{return "spe_side"}
			return "spe_b"
		}
		if key_action_1_hold
		{
			if key_up && !key_left && !key_right
			{return "atk_up"}
			if abs(hsp) < min_dash_speed && !key_down && ((!key_left && !key_right) || on_ground || abs(hsp) < min_sideatk_speed)
			{return "atk_b"}
		}
	}
}

// Création du oPointeur_joueur

instance_create_layer(x, y, "Player", oPointeur_joueur, {owner : id})

// Initialisation des touches

key_left = 0
key_right = 0
key_jump = 0
key_up = 0
key_down = 0
key_action_1 = 0
key_action_2 = 0
key_action_1_hold = 0
key_action_2_hold = 0
key_action_1_end = 0
key_action_2_end = 0