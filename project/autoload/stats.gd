extends Node

@warning_ignore_start("unused_signal")
@warning_ignore_restore("unused_signal")

var health:StringName = &"Health"
var attack:StringName = &"Attack"
var attack_speed_multiplier:StringName = &"Attack Speed"

enum names {health, attack, attack_speed_multiplier}

func return_name(stat_enum: names) -> StringName:
	match stat_enum:
		names.health: return health
		names.attack: return attack
		names.attack_speed_multiplier: return attack_speed_multiplier
	return &""
