extends Node

@warning_ignore_start("unused_signal")
signal turn_ready(combatant:String)
signal ui_update()
@warning_ignore_restore("unused_signal")

func _ready() -> void:
	turn_ready.connect(print_a_debug)

func print_a_debug(text:String) -> void:
	print_debug(text)
