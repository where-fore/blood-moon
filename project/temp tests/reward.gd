extends Node
class_name Reward

var value:int
var stat:StringName

func setup(stat_name:StringName, value_to_add:int) -> void:
	value = value_to_add
	
	if not stat_name in Stats.stats:
		push_error("supplied stat not recognized: ", stat_name)
		return
	stat = stat_name
