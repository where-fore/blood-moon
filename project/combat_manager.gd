extends Node2D

@export var player_combatant:Combatant
@export var enemy_combatant:Combatant
var combatants:Array[Combatant]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BasicEvents.ui_update.emit()
	BasicEvents.start_combat.connect(start_combat)
	@warning_ignore("untyped_declaration")
	BasicEvents.combatant_died.connect(func(_dead_combatant:Combatant): end_combat())
	
	player_combatant.is_the_player = true
	
	combatants = [player_combatant, enemy_combatant]
	player_combatant.current_target = enemy_combatant
	enemy_combatant.current_target = player_combatant

func start_combat() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = true

func end_combat() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = false
		combatant.reset_after_combat()
