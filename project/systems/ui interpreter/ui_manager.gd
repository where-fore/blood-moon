extends Node2D

@export var enemy_screen:Control
@export var reward_screen:Control
@export var special_reward_screen:Control
@export var player_combatant:CombatantUI
@export var enemy_combatant:CombatantUI

func _ready() -> void:
	enemy_screen.visible = false
	reward_screen.visible = false
	special_reward_screen.visible = false
	
	show_special_reward()
	
	BasicEvents.swap_to_combat_screen.connect(swap_to_combat)
	BasicEvents.swap_to_reward_screen.connect(swap_to_reward)
	BasicEvents.player_lost.connect(show_special_reward)
	
	UiEvents.new_player_combatant.connect(setup_player_combatant_ui)
	UiEvents.new_enemy_combatant.connect(setup_enemy_combatant_ui)

func swap_to_combat() -> void:
	enemy_screen.visible = true
	reward_screen.visible = false
	special_reward_screen.visible = false

func swap_to_reward() -> void:
	enemy_screen.visible = false
	reward_screen.visible = true

func show_special_reward() -> void:
	special_reward_screen.visible = true

func setup_player_combatant_ui(combatant:Combatant) -> void:
	setup_combatant_ui(player_combatant, combatant)

func setup_enemy_combatant_ui(combatant:Combatant) -> void:
	setup_combatant_ui(enemy_combatant, combatant)

func setup_combatant_ui(ui:CombatantUI, combatant:Combatant) -> void:
	ui.setup(combatant)
