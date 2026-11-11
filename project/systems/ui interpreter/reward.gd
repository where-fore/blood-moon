extends Resource
class_name Reward

@export var value:int
@export var stat:Stats.Names
@export var image:Texture

func setup(stat_name:Stats.Names, value_to_add:int) -> void:
	value = value_to_add
	
	if not stat_name in Stats.Names:
		push_error("supplied stat not recognized: ", stat_name)
		return
	stat = stat_name
