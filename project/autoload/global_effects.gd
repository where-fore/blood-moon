extends Node

signal effects_update

var additive_stat_dictionary:Dictionary[Stats.Names, int]

func increase_additive_bonus(stat:Stats.Names, value:int) -> void:
	if additive_stat_dictionary.has(stat):
		additive_stat_dictionary[stat] += value
	else:
		additive_stat_dictionary[stat] = value
	effects_update.emit()
