extends Node2D

func _ready() -> void:
	UiEvents.death_animation_finished.connect(ready_to_rotate_combatants)

func ready_to_rotate_combatants() -> void:
	GameflowEvents.start_new_combat.emit()
