extends Control
class_name CombatantUI

var combatant_to_track:Combatant
@export var health_label:Label
@export var attack_label:Label
@export var speed_label:Label
@export var turn_timer:TurnTimer
@export var portrait:TextureRect

func setup(combatant:Combatant) -> void:
	combatant_to_track = combatant
	if not combatant_to_track: push_error(name, " was not assigned a combatant to track")
	
	if not turn_timer: push_error(name, " was not assigned a turntimer to track")
	turn_timer.setup(combatant_to_track)
	
	UiEvents.combatant_ui_update.connect(update)

func update(combatant:Combatant) -> void:
	if combatant == combatant_to_track:
		health_label.text = str(combatant.current_max_health - combatant.current_sustained_damage)
		attack_label.text = str(combatant.current_attack)
		speed_label.text = str(snappedf(combatant.current_attack_speed, 0.01))
		portrait.texture = combatant.portrait
		turn_timer.update()
