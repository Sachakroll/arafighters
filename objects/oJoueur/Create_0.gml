// Initialisation des variables

push_possible = false

hsp = 0
vsp = 0
sneak = false
on_ground = true
doublejump_count = 0
still_timer = 0
still = true

n_projectile = 0
mort = false

// Initialisation des réglages

walk_acc = 0.7
max_walksp = 4
normal_jumpforce = 8.5
normal_doublejumpforce = 6.5
normal_grv = 0.3

sneak_acc = 0.4
max_sneaksp = 2
sneak_jumpforce = 6
sneak_grv = 0.5

grv = normal_grv
sneak_pixel_difference = 24
still_cooldown_duration = 300
max_doublejump_amount = 1
min_doublejump_height = 8

frct = 0.3
air_frct = 0.05

push_force = 1
facteur_repulsion = 0.1

// Initialisation des attaques

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
dmg_cooldown_to_can_attack = 20 // Durée pendant laquelle le joueur ne peut pas attaquer après s'être pris des dégâts
can_attack = false

mort = false
mort_fin = false

resurrect_timer = 0
resurrect_cooldown = 60

// Fonction dégats

function damage(pv_loss, recul)
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
		hsp += recul
		// Reset le cooldown de dégats
		dmg_timer = 0
	}
	// Mort finale (plus de vies)
	if global.ruleset_style = "vies" && vies = 0
	{
		mort_fin = true
	}
}

// Création du oPointeur_joueur

instance_create_layer(x, y, "Player", oPointeur_joueur, {owner : id})