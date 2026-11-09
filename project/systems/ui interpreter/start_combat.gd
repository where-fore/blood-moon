extends Button

func _ready() -> void:
	visible = true
	BasicEvents.swap_to_combat_screen.connect(enable)

func enable() -> void:
	visible = true

func _on_pressed() -> void:
	BasicEvents.start_combat.emit()
	visible = false
