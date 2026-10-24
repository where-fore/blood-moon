extends PanelContainer

@export var health_label:Label
@export var attack_label:Label
@export var turn_indicator:ProgressBar
@export var manager:Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BasicEvents.ui_update.connect(update_values)

func update_values() -> void:
	if turn_indicator.combatant_name == "Player":
		health_label.text = str(manager.player_health)
		attack_label.text = str(manager.player_attack)
	if turn_indicator.combatant_name == "Enemy":
		health_label.text = str(manager.enemy_health)
		attack_label.text = str(manager.enemy_attack)
