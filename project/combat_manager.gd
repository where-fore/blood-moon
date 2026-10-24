extends Node2D

var player_health:int = 200
var player_attack:int = 125
var enemy_health:int = 200
var enemy_attack:int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BasicEvents.turn_ready.connect(take_turn)
	BasicEvents.ui_update.emit()

func take_turn(combatant:String) -> void:
	if combatant == "Player":
		enemy_health -= player_attack
	elif combatant == "Enemy":
		player_health -= enemy_attack
	BasicEvents.ui_update.emit()
