//Initialisation du terrain

global.player1_spawn_y = 296
global.player1_spawn_x = 92
global.player2_spawn_y = 296
global.player2_spawn_x = 422

if global.easteregg_state = 1 || global.easteregg_state = 2 {instance_create_layer(0, 0, "Map", oMap_bus_easteregg)}
