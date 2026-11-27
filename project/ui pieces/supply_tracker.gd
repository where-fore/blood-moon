extends PanelContainer
class_name SupplyTracker

@export var icon:TextureRect
@export var label:Label
var supply_tracking:Supply

func setup(supply_to_track:Supply) -> void:
	supply_tracking = supply_to_track
	update_ui()

func update_ui() -> void:
	label.text = str(Economy.get_amount(supply_tracking))
	icon.texture = supply_tracking.icon
