extends ProgressBar
class_name TurnTimer

var combatant_to_track:Combatant

func setup(combatant:Combatant) -> void:
	combatant_to_track = combatant

func update() -> void:
	if not combatant_to_track:
		push_error(name, " was not assigned a combatant to track")
		return
	max_value = combatant_to_track.current_attack_speed
	value = combatant_to_track.elapsed_turn_timer
