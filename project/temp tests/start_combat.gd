extends Button

func _ready() -> void:
	visible = true

func _on_pressed() -> void:
	BasicEvents.start_combat.emit()
	visible = false
