extends Node

var additive_stat_dictionary:Dictionary[Stats.Names, int]

func _ready() -> void:
	additive_stat_dictionary[Stats.Names.ATTACK] = 20
