extends Node

@warning_ignore_start("unused_signal")
@warning_ignore_restore("unused_signal")

enum Names {health, attack, attack_speed_multiplier}
var health:StringName = &"Health"
var attack:StringName = &"Attack"
var attack_speed_multiplier:StringName = &"Attack Speed"

enum DurationType {permanent, this_combat, combats, turns, special}
var permanent:StringName = &"Permanent"
var this_combat:StringName = &"This combat"
var combats:StringName = &"Combats"
var turns:StringName = &"Turns"
var special:StringName = &"Special"

func return_name(sent_enum: Names) -> StringName:
	match sent_enum:
		Names.health: return health
		Names.attack: return attack
		Names.attack_speed_multiplier: return attack_speed_multiplier
	push_error("tried to return and failed, was sent: ", sent_enum, " and found nothing in Names")
	return &""

func return_duration_type(sent_enum: DurationType) -> StringName:
	match sent_enum:
		DurationType.permanent: return permanent
		DurationType.this_combat: return this_combat
		DurationType.combats: return combats
		DurationType.turns: return turns
		DurationType.special: return special
	push_error("tried to return and failed, was sent: ", sent_enum, " and found nothing in DurationType")
	return &""
