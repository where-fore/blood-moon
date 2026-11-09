extends ProgressBar

@export var combatant_to_track:Combatant

func _ready() -> void:
	if not combatant_to_track: push_error(name, " was not assigned a combatant to track")
	UiEvents.combatant_ui_update.connect(update)

func update(combatant_check:Combatant) -> void:
	if combatant_check == combatant_to_track:
		max_value = combatant_check.current_attack_speed
		value = combatant_check.elapsed_turn_timer
