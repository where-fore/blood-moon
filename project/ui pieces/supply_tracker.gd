extends PanelContainer
class_name SupplyTracker

@export var icon:TextureRect
@export var label:Label
var supply_tracking:Supply

func setup(supply_to_track:Supply) -> void:
	supply_tracking = supply_to_track
	icon.texture = supply_to_track.icon

func update_ui(new_value:int) -> void:
	label.text = str(new_value)
