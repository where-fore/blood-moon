extends Resource
class_name Reward

@export var value:int
@export var stat:Stats.stats
@export var image:Texture

func setup(stat_name:Stats.stats, value_to_add:int) -> void:
	value = value_to_add
	
	if not stat_name in Stats.stats:
		push_error("supplied stat not recognized: ", stat_name)
		return
	stat = stat_name
