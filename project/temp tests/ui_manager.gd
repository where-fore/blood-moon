extends Node2D

@export var enemy_screen:Control
@export var reward_screen:Control

func _ready() -> void:
	enemy_screen.visible = true
	reward_screen.visible = false
	
	BasicEvents.swap_to_combat_screen.connect(swap_to_combat)
	BasicEvents.swap_to_reward_screen.connect(swap_to_reward)

func swap_to_combat() -> void:
	enemy_screen.visible = true
	reward_screen.visible = false

func swap_to_reward() -> void:
	enemy_screen.visible = false
	reward_screen.visible = true
