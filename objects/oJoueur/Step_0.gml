//Récupération des touches pressées

if player = 1
{
	key_left = keyboard_check(global.player1_key_left)
	key_right = keyboard_check(global.player1_key_right)
	key_jump = keyboard_check_pressed(global.player1_key_jump)
	key_sneak = keyboard_check(global.player1_key_sneak)
	key_action_1 = keyboard_check_pressed(global.player1_key_action1)
	key_action_2 = keyboard_check_pressed(global.player1_key_action2)
}
if player = 2
{
	key_left = keyboard_check(global.player2_key_left)
	key_right = keyboard_check(global.player2_key_right)
	key_jump = keyboard_check_pressed(global.player2_key_jump)
	key_sneak = keyboard_check(global.player2_key_sneak)
	key_action_1 = keyboard_check_pressed(global.player2_key_action1)
	key_action_2 = keyboard_check_pressed(global.player2_key_action2)
}

//Mouvement

move = key_right - key_left

//Sneak on/off

if key_sneak {sneak = true}
if !key_sneak && !place_meeting(x, y-sneak_pixel_difference, oCollision)
{sneak = false}

//Vitesse et gravité en sneak / pas en sneak

if sneak {if abs(hsp+(move*sneaksp)) <= max_sneaksp
	{hsp += move * sneaksp}
	else {hsp = max_sneaksp * sign(hsp)}
	grv = sneak_grv}

if !sneak {if abs(hsp+(move*walksp)) <= max_walksp
	{hsp += move * walksp}
	else {hsp = max_walksp * sign(hsp)}
	grv = normal_grv}
	
//Est-ce que le joueur est sur le sol

if place_meeting(x, y+1, oCollision)
     {on_ground = true}
else {on_ground = false}

//Frottements différents dans l'air et sur le sol

if on_ground
{
	if hsp >= frct                                       {hsp -= frct}
	if hsp <= -frct                                      {hsp += frct}
	if hsp > -frct && hsp < frct && move = 0             {hsp = 0}
}
if !on_ground
{
	if hsp >= air_frct                                   {hsp -= air_frct}
	if hsp <= -air_frct                                  {hsp += air_frct}
	if hsp > -air_frct && hsp < air_frct && move = 0     {hsp = 0}
}

//Application de la gravité

vsp = vsp + grv

//Saut

if on_ground {jumpcount = 0}

if on_ground && key_jump
{
	if sneak {vsp = -sneak_jumpforce}
	else {vsp = -normal_jumpforce}
	jumpcount += 1
}
if (!on_ground && vsp > 0 && jumpcount > 0 && jumpcount < max_jump_amount && !place_meeting(x, y+8, oCollision)) && key_jump && sneak = false
{
	vsp = -normal_doublejumpforce
	jumpcount += 1
}

//Collisions

if place_meeting(x+hsp, y, oCollision)
{
	while !place_meeting(x+sign(hsp), y, oCollision)
	{
		x = x + sign(hsp)
	}
	hsp = 0
}

if place_meeting(x, y+vsp, oCollision)
{
	while !place_meeting(x, y+sign(vsp), oCollision)
	{
		y = y + sign(vsp)
	}
	vsp = 0
}

if place_meeting(x+hsp, y, adv_inst)
{
	adv_inst.x += hsp/2
	hsp = hsp/2
}

//Exécution du mouvement

x = x + hsp
y = y + vsp

//Etablir la direction du personnage

if key_left {dir = -1
	still_timer = 0}
if key_right {dir = 1
	still_timer = 0}

still_timer++
if still_timer >= still_cooldown_duration {dir = 0}

//show_debug_message("dir : "+string(dir))
//show_debug_message("jumpcount : "+string(jumpcount))
//show_debug_message("on_ground : "+string(on_ground))


// Collisions avec un projectile

var collisions = [];

with (oProjectile) {
    if (expediteur != other.id && place_meeting(x, y, other.id)) {
        array_push(collisions, id);
    }
}

for (var i = 0; i < array_length(collisions); i++) {
    var projectile = collisions[i];
	hsp += projectile.energie * 3
	projectile.expediteur.n_projectile--
	pv -= projectile.degats
	instance_destroy(projectile)
}

if (pv <= 0)
{
	instance_destroy()
}


// Lancement d'un projectile

if key_action_1 && dir != 0 && n_projectile < n_projectile_max
{
	instance_create_layer(x, y,"Player",oProjectile,
	{
		expediteur: id,
		energie : v_projectile * dir,
		sprite_index: s_projectile,
		masse: m_projectile,
		degats: d_projectile
	})
	n_projectile += 1
}