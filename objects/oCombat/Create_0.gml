init = 0

// Transition

state = "fade1"
fade_time = 60
fade_timer = 0

// Initialisations des personnages

global.player1_char = oGabriel
global.player2_char = oGabriel
global.player1_hitbox_sprite = sGabriel_hitbox
global.player2_hitbox_sprite = sPotvin_hitbox

// Initilisation du timer

if global.ruleset_style = "temps"
{global.battle_timer = global.ruleset_time*3600+60}
if global.ruleset_style = "vies"
{global.battle_timer = 0}

global.pause = 0

// Réglages de l'interface

ecart_x_barre_pv = 10
ecart_y_barre_pv = 10
taille_x_barre_pv = 479
taille_y_barre_pv = 39

x_pos_timer = 600
x_char_size = 24

// Initialisation des mécaniques de combat

global.x_offscreen_projectile_margin = 64
global.y_offscreen_projectile_margin = 32

// Animations de double saut

p1_doublejumping = false
p2_doublejumping = false