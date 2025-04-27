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
still_timer = 0
still = true

n_projectile = 0

// Initialisation des réglages

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

sneak_pixel_difference = 24
still_cooldown_duration = 300
max_doublejump_amount = 1
min_doublejump_height = 8
frct = 0.3
air_frct = 0.025
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
atk_charge = 0
min_atk_charge = 10

has_boomerang = false

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
mort_fin = false

resurrect_timer = 0
resurrect_cooldown = 60

// Fonction dégats

function damage(pv_loss, dmg_duration, h_knockback, v_knockback)
{
	if dmg_timer = 0 && !mort_fin && !mort
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
		// Recul
		hsp += h_knockback
		vsp += v_knockback
		// Reset le cooldown de dégats
		dmg_timer = dmg_duration
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
			else if key_down
			{return "spe_down"}
			else if key_left || key_right || abs(hsp) >= min_sideatk_speed
			{return "spe_side"}
			else {return "spe_b"}
		}
		if key_action_1
		{
			if key_up && !key_left && !key_right
			{return "atk_up"}
			else if key_down && !on_ground
			{return "atk_downair"}
			else if (key_left || key_right) && !on_ground && abs(hsp) >= min_sideatk_speed
			{return "atk_sideair"}
			else if on_ground && abs(hsp) >= min_dash_speed
			{return "atk_dash"}
			else
			{
				if sneak {return "atk_sneak"}
				else {return "atk_b"}
			}
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