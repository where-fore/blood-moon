extends Node2D

@export var player_combatant:Combatant
@export var enemy_combatant:Combatant
var combatants:Array[Combatant]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BasicEvents.ui_update.emit()
	BasicEvents.start_combat.connect(start_combat)
	BasicEvents.combatant_died.connect(end_combat)
	BasicEvents.player_lost.connect(restart_game)
	
	player_combatant.is_the_player = true
	
	combatants = [player_combatant, enemy_combatant]
	player_combatant.current_target = enemy_combatant
	enemy_combatant.current_target = player_combatant

func start_combat() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = true

func end_combat(dead_combatant:Combatant) -> void:
	end_of_combat_cleanup()
	if not dead_combatant.is_the_player: BasicEvents.swap_to_reward_screen.emit()

func restart_game() -> void:
	end_of_combat_cleanup()
	for combatant:Combatant in combatants:
		combatant.reset_stats_to_starting_base()

func end_of_combat_cleanup() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = false
		combatant.reset_after_combat()
