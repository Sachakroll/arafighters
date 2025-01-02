// Initialisation des variables

push_possible = false

hsp = 0
vsp = 0
sneak = false
on_ground = true
jumpcount = 0
still_timer = 0
still = true

n_projectile = 0
mort = false

// Initialisation des réglages

max_pv = 100
pv = max_pv

walksp = 0.7
max_walksp = 4
normal_jumpforce = 8.5
normal_doublejumpforce = 6.5
normal_grv = 0.3

sneaksp = 0.4
max_sneaksp = 2
sneak_jumpforce = 6
sneak_grv = 0.5

grv = normal_grv
sneak_pixel_difference = 24
still_cooldown_duration = 300
max_jump_amount = 2

frct = 0.3
air_frct = 0.05

push_force = 1
facteur_repulsion = 0.1

// Initialisation des attaques

has_boomerang = false

// Initialisation des vies et du timer

if global.ruleset_style = "vies"
{
	vies = global.ruleset_vies
}
if global.ruleset_style = "temps"
{
	vies = 0
}

mort = false
mort_fin = false