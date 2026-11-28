extends PanelContainer
class_name UnlockButton

@export var description_label:Label
@export var cost_label:Label
@export var button:TextureButton
var unlock_data:UnlockData

var activateable:bool = false

func setup(new_unlock_data:UnlockData) -> void:
	unlock_data = new_unlock_data
	
	description_label.text = unlock_data.description
	cost_label.text = str(unlock_data.cost)
	button.texture_normal = unlock_data.cost_supply.icon
	
	UiEvents.supply_updated.connect(check_if_activateable)
	
	fade_out()

func check_if_activateable(supply_updated:Supply) -> void:
	if supply_updated == unlock_data.cost_supply:
		if Economy.can_afford(supply_updated, unlock_data.cost):
			if not activateable: fade_in()
		else:
			if activateable: fade_out()

func fade_out() -> void:
	modulate = Color(0.2, 0.2, 0.2, 1)
	activateable = false

func fade_in() -> void:
	modulate = Color(1, 1, 1, 1)
	activateable = true

func _on_texture_button_pressed() -> void:
	if Economy.can_afford(unlock_data.cost_supply, unlock_data.cost):
		Economy.remove_supply(unlock_data.cost_supply, unlock_data.cost)
		GlobalEffects.increase_additive_bonus(unlock_data.bonus_stat, unlock_data.bonus_value)
