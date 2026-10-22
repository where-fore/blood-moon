extends ProgressBar

@export var speed:int = 20
@export var combatant_name:String

func _ready() -> void:
	if not combatant_name: push_error("did not set combatant name on testing turn bar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value += delta*speed
	if value >= 100:
		value = 0
		BasicEvents.turn_ready.emit(combatant_name)
