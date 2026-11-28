extends Node2D

@export var player_combatant_base_scene:PackedScene
@export var enemy_combatant_base_scene:PackedScene
var player_combatant:Combatant
var enemy_combatant:Combatant
var combatants:Array[Combatant]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BasicEvents.ui_update.emit()
	BasicEvents.start_combat.connect(start_combat)
	GameflowEvents.start_new_combat.connect(prepare_combat)
	
	call_deferred("prepare_combat")

func prepare_combat() -> void:
	var player_prepped:bool = false
	var enemy_prepped:bool = false
	for combatant:Combatant in combatants:
		if combatant.controlled_by_player: player_prepped = true
		elif not combatant.controlled_by_player: enemy_prepped = true
	
	if not player_prepped:
		player_combatant = create_combatant(player_combatant_base_scene)
		player_combatant.controlled_by_player = true
		combatants.append(player_combatant)
		UiEvents.new_player_combatant.emit(player_combatant)
	if not enemy_prepped:
		enemy_combatant = create_combatant(enemy_combatant_base_scene)
		combatants.append(enemy_combatant)
		UiEvents.new_enemy_combatant.emit(enemy_combatant)
	
	player_combatant.current_target = enemy_combatant
	enemy_combatant.current_target = player_combatant

func create_combatant(combatant_base_scene:PackedScene) -> Combatant:
	var new_combatant:Combatant = combatant_base_scene.instantiate()
	add_child(new_combatant)
	new_combatant.died.connect(end_combat)
	return new_combatant

func start_combat() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = true

func end_combat(dead_combatant:Combatant) -> void:
	if dead_combatant.controlled_by_player:
		pass
	else:
		dead_combatant.get_reward_for_defeat()
		combatants.erase(dead_combatant)
		dead_combatant.queue_free()
	end_of_combat_cleanup()

#func restart_game() -> void:
#	end_of_combat_cleanup()
#	for combatant:Combatant in combatants:
#		combatant.reset_stats_to_starting_base()

#func strengthen_enemies() -> void:
#	for combatant:Combatant in combatants:
#		if not combatant.controlled_by_player:
#			combatant.upgrade_over_time()

func end_of_combat_cleanup() -> void:
	for combatant:Combatant in combatants:
		combatant.active_in_combat = false
		combatant.reset_after_combat()
