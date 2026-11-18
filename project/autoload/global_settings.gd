extends Node

var combat_time_scale:float = 1.0:
	set(value):
		if value < 0:
			combat_time_scale = 0
		else:
			combat_time_scale = value
		print_debug("told to set time scale to: ", value, ". set to: ", combat_time_scale)
