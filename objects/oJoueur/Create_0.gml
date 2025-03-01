// Initialisation des variables 

state = "neutral"

hsp = 0
vsp = 0
sneak = false
on_ground = true
has_jumped = false
time_since_on_ground = 0
doublejump_count = 0
still_timer = 0
still = true
push_possible = false

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
max_sneaksp = 1.5
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

dmg_timer = 0 // Temps écoulé depuis que le joueur a pris des dégâts
dmg_cooldown = 20 // Durée du temps d'invicibilité après avoir pris des dégâts
dmg_cooldown_to_neutral = 20 // Durée pendant laquelle le joueur ne peut pas attaquer après s'être pris des dégâts

mort = false
mort_fin = false

resurrect_timer = 0
resurrect_cooldown = 60

// Fonction dégats

function damage(pv_loss, h_knockback, v_knockback)
{
	if dmg_timer >= dmg_cooldown && !mort_fin && !mort
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
		dmg_timer = 0
		// État de dégats
		state = "damage"
	}
	// Mort finale (plus de vies)
	if global.ruleset_style = "vies" && vies = 0
	{
		mort_fin = true
	}
}

// Création du oPointeur_joueur

instance_create_layer(x, y, "Player", oPointeur_joueur, {owner : id})