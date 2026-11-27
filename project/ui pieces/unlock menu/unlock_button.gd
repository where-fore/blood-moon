extends PanelContainer
class_name UnlockButton

@export var description_label:Label
@export var cost_label:Label
@export var button:TextureButton
var data_object:UnlockData

func setup(unlock_data:UnlockData) -> void:
	data_object = unlock_data
	description_label.text = data_object.description
	cost_label.text = str(data_object.cost)
	button.texture_normal = data_object.cost_supply.icon
