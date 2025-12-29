// Initialisation du jeu

fullscreen = false

global.ruleset_style = "vies"
global.ruleset_time = 5
global.ruleset_vies = 5

global.skip_title_after_config = false
global.title_enable_fade_in = false

global.map = Map_bus
global.easteregg_state = 0

// Son

global.volume = 1
global.music = -1

// Contrôles par défaut

// Joueur 1

global.player1_key_left = vk_left
global.player1_key_right = vk_right
global.player1_key_up = vk_up
global.player1_key_down = vk_down

global.player1_key_action1 = vk_enter
global.player1_key_action2 = vk_rshift
global.player1_key_guard = vk_rcontrol
global.player1_key_grab = vk_backspace

global.player1_key_pause = ord("P")

// Joueur 2

global.player2_key_left = ord("Q")
global.player2_key_right = ord("D")
global.player2_key_up = ord("Z")
global.player2_key_down = ord("S")

global.player2_key_action1 = vk_space
global.player2_key_action2 = vk_lshift
global.player2_key_guard = vk_lcontrol
global.player2_key_grab = ord("A")

global.player2_key_pause = ord("T")

// Manettes

global.p1_controller = -1
global.p2_controller = -1

global.gp_deadzone = 0.5

// Joueur 1

global.p1_gp_x_axis = 0
global.p1_gp_y_axis = 1
global.p1_gp_invert_y_axis = 0
global.p1_gp_jump = 0

global.p1_gp_action1 = 1
global.p1_gp_action2 = 2
global.p1_gp_guard = 3
global.p1_gp_grab = 4

global.p1_gp_pause = 5

// Joueur 2

global.p2_gp_x_axis = 0
global.p2_gp_y_axis = 1
global.p2_gp_invert_y_axis = 0
global.p2_gp_jump = 0

global.p2_gp_action1 = 1
global.p2_gp_action2 = 2
global.p2_gp_guard = 3
global.p2_gp_grab = 4

global.p2_gp_pause = 5

// Debug

global.battle_intro_skip = false