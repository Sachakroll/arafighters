x = owner.x + x_pos
y = owner.y + y_pos

if owner.state = "atk_b_active" || owner.state = "atk_dash_active" || owner.state = "atk_up_active" || owner.state = "atk_downair_active" || owner.state = "atk_sideair_active"
{
	actif = true
	
	if owner.state = "atk_downair_active" && owner.atk_downair_type = "pierce" && touched && can_bounce && owner.vsp < 0
	{
		owner.vsp -= 4
		can_bounce = false
	}
}
else {actif = false}