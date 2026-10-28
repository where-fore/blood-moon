extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	BasicEvents.swap_to_reward_screen.connect(arrive)

func arrive() -> void:
	visible = true

func _on_pressed() -> void:
	visible = false
