extends Node2D


func _unhandled_input(event:InputEvent) -> void:
	@warning_ignore("unsafe_property_access")
	if event.pressed and event is InputEventKey:
		var key_event:InputEventKey = event
		if key_event.keycode == KEY_F1:
			change_time_speed(0.2)
		if key_event.keycode == KEY_F2:
			change_time_speed(-0.2)

func change_time_speed(amount:float) -> void:
	GlobalSettings.combat_time_scale += amount
