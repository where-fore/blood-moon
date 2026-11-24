extends TextureButton

func on_pressed() -> void:
	BasicEvents.start_combat.emit()
	modulate = Color(0.2,0.2,0.2,1)

func _ready() -> void:
	GameflowEvents.start_new_combat.connect(reset_button)

func reset_button() -> void:
	modulate = Color(1,1,1,1)
