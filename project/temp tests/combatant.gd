extends Node2D
class_name Combatant

@export var starting_max_health:int
@export var starting_attack:int
@export var starting_turn_cooldown:int

var is_the_player:bool = false

var current_max_health:int
var current_sustained_damage:int:
	set(value):
		current_sustained_damage = value
		UiEvents.combatant_ui_update.emit(self)
var current_attack:int

var active_in_combat:bool = false
var current_target:Combatant

var turn_cooldown:float
var elapsed_turn_timer:float = 0:
	set(value):
		elapsed_turn_timer = value
		UiEvents.combatant_ui_update.emit(self)

func _ready() -> void:
	if starting_max_health < 1: push_error("starting_max_health not initialized on: ", name)
	if starting_attack < 1: push_error("starting_attack not initialized on: ", name)
	if starting_turn_cooldown < 1: push_error("starting_turn_cooldown not initialized on: ", name)
	reset_stats_to_starting_base()

func _process(delta: float) -> void:
	if active_in_combat:
		increment_turn_timer(delta)

func increment_turn_timer(delta:float) -> void:
	elapsed_turn_timer += delta # *Globals.CombatTimeScale
	while elapsed_turn_timer >= turn_cooldown:
		elapsed_turn_timer -= turn_cooldown
		take_turn()

func take_damage(amount:int) -> void:
	current_sustained_damage += amount
	if current_sustained_damage >= current_max_health:
		BasicEvents.combatant_died.emit(self)

func take_turn() -> void:
	current_target.take_damage(current_attack)

func reset_after_combat() -> void:
	current_sustained_damage = 0
	elapsed_turn_timer = 0
	UiEvents.combatant_ui_update.emit(self)

func reset_stats_to_starting_base() -> void:
	current_max_health = starting_max_health
	current_attack = starting_attack
	current_sustained_damage = 0
	turn_cooldown = starting_turn_cooldown
