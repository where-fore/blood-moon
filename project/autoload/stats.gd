extends Node

@warning_ignore_start("unused_signal")
@warning_ignore_restore("unused_signal")

enum Names {HEALTH, ATTACK, ATTACK_SPEED_MULTIPLIER}
var HEALTH:StringName = &"Health"
var ATTACK:StringName = &"Attack"
var ATTACK_SPEED_MULTIPLIER:StringName = &"Attack Speed"

enum DurationType {PERMANENT, THIS_COMBAT, COMBATS, TURNS, SPECIAL}
var PERMANENT:StringName = &"Permanent"
var THIS_COMBAT:StringName = &"This combat"
var COMBATS:StringName = &"Combats"
var TURNS:StringName = &"Turns"
var SPECIAL:StringName = &"Special"

func return_name(sent_enum: Names) -> StringName:
	match sent_enum:
		Names.HEALTH: return HEALTH
		Names.ATTACK: return ATTACK
		Names.ATTACK_SPEED_MULTIPLIER: return ATTACK_SPEED_MULTIPLIER
	push_error("tried to return and failed, was sent: ", sent_enum, " and found nothing in Names")
	return &""

func return_duration_type(sent_enum: DurationType) -> StringName:
	match sent_enum:
		DurationType.PERMANENT: return PERMANENT
		DurationType.THIS_COMBAT: return THIS_COMBAT
		DurationType.COMBATS: return COMBATS
		DurationType.TURNS: return TURNS
		DurationType.SPECIAL: return SPECIAL
	push_error("tried to return and failed, was sent: ", sent_enum, " and found nothing in DurationType")
	return &""
