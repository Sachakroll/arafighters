//Initialisation du terrain

player1_spawn_height = 349
player2_spawn_height = 349

//Initialisation des joueurs

//deux lignes suivantes à déplacer :
global.player1_char = oGabriel
global.player2_char = oGabriel

player1_inst = instance_create_layer(197,player1_spawn_height,"Player",global.player1_char,
{
	player : 1,
	dir : 0
})

player1_inst = instance_create_layer(360,player2_spawn_height,"Player",global.player2_char,
{
	player : 2,
	dir : 0
})

//à déplacer

global.player1_key_left = vk_left
global.player1_key_right = vk_right
global.player1_key_jump = vk_up
global.player1_key_sneak = vk_down

global.player2_key_left = ord("Q")
global.player2_key_right = ord("D")
global.player2_key_jump = ord("Z")
global.player2_key_sneak = ord("S")
