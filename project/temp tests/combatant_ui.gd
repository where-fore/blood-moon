extends PanelContainer

@export var combatant_to_track:Combatant
@export var health_label:Label
@export var attack_label:Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not combatant_to_track: push_error(name, " was not assigned a combatant to track")
	UiEvents.combatant_ui_update.connect(update)

func update(combatant:Combatant) -> void:
	if combatant == combatant_to_track:
		health_label.text = str(combatant.current_max_health - combatant.current_sustained_damage)
		attack_label.text = str(combatant.current_attack)
