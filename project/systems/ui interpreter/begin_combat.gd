extends TextureButton

func on_pressed() -> void:
	BasicEvents.start_combat.emit()
	modulate = Color(0.2,0.2,0.2,1)
