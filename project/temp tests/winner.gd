extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	@warning_ignore("untyped_declaration")
	BasicEvents.combatant_died.connect(func(_dead_combatant:Combatant): arrive())

func arrive() -> void:
	visible = true

func _on_pressed() -> void:
	visible = false
