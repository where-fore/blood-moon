extends Node

var combat_time_scale:float = 1.0:
	set(value):
		if value < 0:
			combat_time_scale = 0
		else:
			combat_time_scale = value
