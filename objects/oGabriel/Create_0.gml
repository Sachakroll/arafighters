event_inherited()

s_prefix = "sGabriel"
hand_height = 56
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

atk_b_base_y_pos = -hand_height
atk_b_base_x_pos = 20
atk_b_portee_suppl_x = 14

// Atk_dash

atk_dash_type = "pierce"
atk_dash_startup_time = 7
atk_dash_active_time = 9
atk_dash_recovery_time = 15

atk_dash_box_sprite = sGab_atk_dash_box

atk_dash_degats = 10
atk_dash_dmg_duration = 24
atk_dash_h_knockback = 5
atk_dash_v_knockback = -2.5

atk_dash_base_y_pos = -hand_height
atk_dash_base_x_pos = 22
atk_dash_portee_suppl_x = 19

// Atk_up

atk_up_type = "pierce"
atk_up_startup_time = 7
atk_up_active_time = 7
atk_up_recovery_time = 15

atk_up_box_sprite = sGab_atk_b_box

atk_up_degats = 12
atk_up_dmg_duration = 42
atk_up_h_knockback = 0
atk_up_v_knockback = -8

atk_up_base_y_pos = -88
atk_up_base_x_pos = 2
atk_up_portee_suppl_y = 30

// Atk_downair

atk_downair_type = "pierce"
atk_downair_startup_time = 10
atk_downair_active_time = 13
atk_downair_recovery_time = 22

atk_downair_box_sprite = sGab_atk_downair_box

atk_downair_degats = 16
atk_downair_dmg_duration = 24
atk_downair_h_knockback = 1
atk_downair_v_knockback = 6
atk_downair_v_bounce_factor = 1.4

atk_downair_base_y_pos = 10
atk_downair_base_x_pos = 0
atk_downair_portee_suppl_y = 22

// Atk_sideair

atk_sideair_type = "pierce"
atk_sideair_startup_time = 6
atk_sideair_active_time = 8
atk_sideair_recovery_time = 13

atk_sideair_box_sprite = sGab_atk_dash_box

atk_sideair_degats = 9
atk_sideair_dmg_duration = 20
atk_sideair_h_knockback = 4
atk_sideair_v_knockback = -2

atk_sideair_base_y_pos = -hand_height
atk_sideair_base_x_pos = 22
atk_sideair_portee_suppl_x = 16

// Spe_b

spe_b_type = "mitr_chb"
spe_b_startup_time = 10
spe_b_active_time = 0
spe_b_recovery_time = 18

spe_b_proj_t1_degats = 4
spe_b_proj_t1_dmg_duration = 8
spe_b_proj_t1_speed = 4

spe_b_proj_t2_ch_time = 16
spe_b_proj_t2_degats = 7
spe_b_proj_t2_dmg_duration = 14
spe_b_proj_t2_speed = 5

spe_b_proj_t2_ch_time = 30
spe_b_proj_t3_degats = 10
spe_b_proj_t3_dmg_duration = 18
spe_b_proj_t3_speed = 6

spe_b_proj_t2_ch_time = 60
spe_b_proj_t4_degats = 16
spe_b_proj_t4_dmg_duration = 22
spe_b_proj_t4_speed = 7

// Spe_side

spe_side_type = "boomerang"
spe_side_startup_time = 20
spe_side_active_time = 0
spe_side_recovery_time = 16

n_max_projectiles_spe_side = 1

boomerang_sprite = sGab_boomerang
boomerang_rotation_sp = 7

boomerang_degats = 12
boomerang_dmg_duration = 25
boomerang_h_knockback = 2
boomerang_v_knockback = -2

boomerang_portee = 240
boomerang_angle = pi/12
boomerang_coefficient_portee_bonus = 10
boomerang_sp = 5.4
boomerang_comeback_acc_time = 30