//Initialisation du terrain

player1_spawn_height = 301
player2_spawn_height = 301

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


