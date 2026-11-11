extends Resource
class_name Reward

@export var value:int
@export var stat:Stats.names
@export var image:Texture

func setup(stat_name:Stats.names, value_to_add:int) -> void:
	value = value_to_add
	
	if not stat_name in Stats.names:
		push_error("supplied stat not recognized: ", stat_name)
		return
	stat = stat_name
