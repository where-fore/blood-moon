extends PanelContainer

@export var aura_icon_scene:PackedScene
@export var vbox_for_aura_displays:VBoxContainer
@export var display_to_delete_on_runtime:Array[Control]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for control:Control in display_to_delete_on_runtime:
		control.queue_free()
	
	UiEvents.send_aura_to_tracker.connect(track_new_aura)

func track_new_aura(new_aura:Reward) -> void:
	var new_aura_tracker:AuraIcon = aura_icon_scene.instantiate()
	vbox_for_aura_displays.add_child(new_aura_tracker)
	new_aura_tracker.aura_to_display = new_aura
