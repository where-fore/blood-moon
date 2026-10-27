extends Node

@warning_ignore_start("unused_signal")
@warning_ignore_restore("unused_signal")

var health:StringName = &"Health"
var attack:StringName = &"Attack"
var attack_speed_multiplier:StringName = &"Attack Speed"

enum stats {health, attack, attack_speed_multiplier}

func return_name(stat_enum: stats) -> StringName:
	match stat_enum:
		stats.health: return health
		stats.attack: return attack
		stats.attack_speed_multiplier: return attack_speed_multiplier
	return &""
