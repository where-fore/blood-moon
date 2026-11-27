extends VBoxContainer

@export var unlock_button_scene:PackedScene
@export var unlocks_to_populate:Array[UnlockData]

func _ready() -> void:
	Toolbox.clear_placeholder_ui_objects(self)
	for unlock:UnlockData in unlocks_to_populate:
		create_new_button(unlock)

func create_new_button(unlock_data:UnlockData) -> void:
	var new_button:UnlockButton = unlock_button_scene.instantiate()
	new_button.setup(unlock_data)
	add_child(new_button)
