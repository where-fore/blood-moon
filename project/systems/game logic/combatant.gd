extends Node2D
class_name Combatant

@export_category("Base Logic")
@export var starting_max_health:int
@export var starting_attack:int
@export var base_attack_speed:float
@export var base_attack_speed_multiplier:int
@export var portrait:Texture
@export_category("Enemy Logic")
@export var supply_on_defeat:Supply
@export var number_of_that_supply:int

signal died(combatant:Combatant)

var controlled_by_player:bool = false:
	set(value):
		controlled_by_player = value
		if controlled_by_player: 
			pass #BasicEvents.reward_chosen.connect(upgrade_with_reward)
		else:
			pass #BasicEvents.reward_chosen.disconnect(upgrade_with_reward)
		recalculate_stats()

var current_max_health:int
var current_sustained_damage:int:
	set(value):
		current_sustained_damage = value
		send_ui_update()
var current_attack:int
var current_base_attack_speed:float
var current_attack_speed_multiplier:int
var current_attack_speed:float:
	get(): return current_base_attack_speed / ((100.0 + float(current_attack_speed_multiplier))/ 100.0)

var active_in_combat:bool = false
var current_target:Combatant

var elapsed_turn_timer:float = 0:
	set(value):
		elapsed_turn_timer = value
		send_ui_update()

func _ready() -> void:
	if not starting_max_health: push_error("starting_max_health not initialized on: ", name)
	if not starting_attack: push_error("starting_attack not initialized on: ", name)
	if not base_attack_speed: push_error("starting_turn_cooldown not initialized on: ", name)
	recalculate_stats()

func _process(delta: float) -> void:
	if active_in_combat:
		increment_turn_timer(delta)

func increment_turn_timer(delta:float) -> void:
	elapsed_turn_timer += delta * GlobalSettings.combat_time_scale
	while elapsed_turn_timer >= current_attack_speed:
		elapsed_turn_timer -= current_attack_speed
		take_turn()

func take_damage(amount:int) -> void:
	current_sustained_damage += amount
	if current_sustained_damage >= current_max_health:
		died.emit(self)

func take_turn() -> void:
	current_target.take_damage(current_attack)

func reset_after_combat() -> void:
	elapsed_turn_timer = 0
	if not controlled_by_player: current_sustained_damage = 0
	if controlled_by_player:
		if current_sustained_damage >= current_max_health:
			current_sustained_damage = 0


func upgrade_over_time() -> void:
	var multiplier:int = 7
	current_max_health += randi_range(5,10) * multiplier
	current_attack += randi_range(1,2) * multiplier
	current_attack_speed_multiplier += randi_range(1,2) * multiplier

func recalculate_stats() -> void:
	current_max_health = starting_max_health
	current_attack = starting_attack
	current_base_attack_speed = base_attack_speed
	current_attack_speed_multiplier = base_attack_speed_multiplier
	
	if controlled_by_player: upgrade_stats_with_global_additive()
	
	send_ui_update()

func upgrade_stats_with_global_additive() -> void:
	for stat:Stats.Names in GlobalEffects.additive_stat_dictionary:
		var value:int = GlobalEffects.additive_stat_dictionary[stat]
		match stat:
			Stats.Names.HEALTH: current_max_health += value
			Stats.Names.ATTACK: current_attack += value
			Stats.Names.ATTACK_SPEED_MULTIPLIER: current_attack_speed_multiplier += value

func send_ui_update() -> void:
	UiEvents.combatant_ui_update.emit(self)

func get_reward_for_defeat() -> void:
	if not supply_on_defeat: push_error("was told to give a reward for defeating, but was not supplied a suitable reward. on: ", name)
	if not number_of_that_supply: push_error("was told to give a reward for defeating, but was not supplied a suitable value for that reward. on: ", name)
	BasicEvents.supply_add.emit(supply_on_defeat, number_of_that_supply)
