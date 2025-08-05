event_inherited()

s_prefix = "sGabriel"
hand_height = 32
sneak_pixel_difference = 16

push_force = 1

// Attaques

// Atk_b

atk_b_type = "pierce"
atk_b_startup_time = 5
atk_b_active_time = 7
atk_b_recovery_time = 9

atk_b_box_sprite = sGab_atk_b_box

atk_b_degats = 8
atk_b_dmg_duration = 18
atk_b_h_knockback = 3
atk_b_v_knockback = -2

atk_b_base_y_pos = -40
atk_b_base_x_pos = 20
atk_b_portee_suppl_x = 12

// Atk_dash

atk_dash_type = "pierce"
atk_dash_startup_time = 7
atk_dash_active_time = 9
atk_dash_recovery_time = 15

atk_dash_box_sprite = sGab_atk_dash_box

atk_dash_degats = 12
atk_dash_dmg_duration = 24
atk_dash_h_knockback = 5
atk_dash_v_knockback = -2.5

atk_dash_base_y_pos = -40
atk_dash_base_x_pos = 20
atk_dash_portee_suppl_x = 16

// Spe_side

spe_side_type = "boomerang"
spe_side_startup_time = 20
spe_side_active_time = 0
spe_side_recovery_time = 16

n_max_projectiles_spe_side = 1

boomerang_sprite = sGab_boomerang
boomerang_rotation_sp = 7

boomerang_degats = 10
boomerang_dmg_duration = 25
boomerang_h_knockback = 2
boomerang_v_knockback = -2

boomerang_portee = 240
boomerang_angle = pi/12
boomerang_coefficient_portee_bonus = 10
boomerang_sp = 5.4
boomerang_comeback_acc_time = 30