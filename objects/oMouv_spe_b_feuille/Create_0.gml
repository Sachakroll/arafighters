shoot_angle_range = 20
smaller_shoot_angle_range = 10

function shoot(_tier, _dir)
{
	var dmg = 0
	var dmg_dur = 0
	var spd = 0
	var h_knbk = 0
	var v_knbk = 0
	var texture = 0
	
	if _tier = 1
	{
		dmg = owner.spe_b_proj_t1_degats
		dmg_dur = owner.spe_b_proj_t1_dmg_duration
		spd = owner.spe_b_proj_t1_speed
		h_knbk = owner.spe_b_proj_t1_h_knockback
		v_knbk = owner.spe_b_proj_t1_v_knockback
		texture = sMouv_spe_b_proj_t1
	}
	if _tier = 2
	{
		dmg = owner.spe_b_proj_t2_degats
		dmg_dur = owner.spe_b_proj_t2_dmg_duration
		spd = owner.spe_b_proj_t2_speed
		h_knbk = owner.spe_b_proj_t2_h_knockback
		v_knbk = owner.spe_b_proj_t2_v_knockback
		texture = sMouv_spe_b_proj_t2
	}
	if _tier = 3
	{
		dmg = owner.spe_b_proj_t3_degats
		dmg_dur = owner.spe_b_proj_t3_dmg_duration
		spd = owner.spe_b_proj_t3_speed
		h_knbk = owner.spe_b_proj_t3_h_knockback
		v_knbk = owner.spe_b_proj_t3_v_knockback
		texture = sMouv_spe_b_proj_t3
	}
	if _tier = 4
	{
		dmg = owner.spe_b_proj_t4_degats
		dmg_dur = owner.spe_b_proj_t4_dmg_duration
		spd = owner.spe_b_proj_t4_speed
		h_knbk = owner.spe_b_proj_t4_h_knockback
		v_knbk = owner.spe_b_proj_t4_v_knockback
		texture = sMouv_spe_b_proj_t4
	}
	
	if random(1)<0.7 || _tier >= 3 {var angle = random_range(-smaller_shoot_angle_range, smaller_shoot_angle_range)}
	else {var angle = random_range(-shoot_angle_range, shoot_angle_range)}
	var img_angle = angle
	if _dir = -1 {angle = 180-angle
		img_angle = -img_angle}
	var h_spd = lengthdir_x(spd, angle)
	var v_spd = lengthdir_y(spd, angle)
	
	var img_nb = floor(random(sprite_get_number(texture)))
	
	// determiner texture
	
	instance_create_layer(x, y, "Player", oProjectile,
	{
		type : "straight",
		expediteur: owner.id,
		friendly_fire : false,
		sprite_index : texture,
		image_index : img_nb,
		degats : dmg,
		dmg_duration : dmg_dur,
		h_knockback : h_knbk,
		v_knockback : v_knbk,
		actif : true,
		
		image_angle : img_angle,
		hsp : h_spd,
		vsp : v_spd
	})
}