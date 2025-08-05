init = 0

// Fin et début du combat

state = "fade1"
fade_time = 80
fade_timer = 0
intro_timer = 0
intro_duration = 180
pre_fin = false
pre_fin_timer = 0
pre_fin_vies_time = 40
pre_fin_temps_time = 10
fin_timer = 0
end_timer = 0
end_appear_time = 40
end_disappear_time = 40
end_infos_p1_done = false
end_infos_p2_done = false

global.p1_dmg_taken = 0
global.p2_dmg_taken = 0

if global.battle_intro_skip {fade_time = 12}

// Déroulé du combat

winner = 0

// Initialisations des personnages (à supprimmer plus tard)

global.player1_char = oGabriel
global.player2_char = oGabriel
global.player1_hitbox_sprite = sGabriel_hitbox
global.player2_hitbox_sprite = sGabriel_hitbox

// Initilisation du timer

if global.ruleset_style = "temps"
{global.battle_timer = global.ruleset_time*3600}
if global.ruleset_style = "vies"
{global.battle_timer = 0}

global.pause = 0

// Réglages de l'interface

ecart_x_barre_pv = 10
ecart_y_barre_pv = 10
taille_x_barre_pv = 479
taille_y_barre_pv = 39

p1_displayed_pv = 0
p2_displayed_pv = 0
p1_old_pv = 0
p2_old_pv = 0

barre_pv_dmg_time = 10
barre_pv_refill_time = 30

x_pos_timer = 600
x_char_size = 24

// Initialisation des mécaniques de combat

global.x_offscreen_projectile_margin = 64
global.y_offscreen_projectile_margin = 32

// Animations de double saut

p1_doublejumping = false
p2_doublejumping = false

// Création d'objets

layer_create((layer_get_depth(layer_get_id("Fade"))+layer_get_depth(layer_get_id("Avant_plan")))/2, "Menu")
instance_create_layer(0, 0, "Menu", oPause)
instance_create_layer(0, 0, "Menu", oBattle_intro)
instance_create_layer(0, 0, "Menu", oBattle_mot_fin)