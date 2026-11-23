extends Node2D

@export var player_combatant:UICombatant
@export var enemy_combatant:UICombatant

func _ready() -> void:
	UiEvents.new_player_combatant.connect(setup_player_combatant_ui)
	UiEvents.new_enemy_combatant.connect(setup_enemy_combatant_ui)

func setup_player_combatant_ui(combatant:Combatant) -> void:
	setup_combatant_ui(player_combatant, combatant)

func setup_enemy_combatant_ui(combatant:Combatant) -> void:
	setup_combatant_ui(enemy_combatant, combatant)

func setup_combatant_ui(ui:UICombatant, combatant:Combatant) -> void:
	ui.setup(combatant)
