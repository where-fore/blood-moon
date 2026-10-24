extends Button

func _on_pressed() -> void:
	BasicEvents.start_combat.emit()
	visible = false
