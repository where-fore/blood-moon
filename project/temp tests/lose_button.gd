extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	BasicEvents.player_lost.connect(arrive)

func arrive() -> void:
	visible = true

func _on_pressed() -> void:
	visible = false
	BasicEvents.swap_to_combat_screen.emit()
