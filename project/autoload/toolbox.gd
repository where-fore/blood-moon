extends Node

func clear_placeholder_ui_objects(control_to_purge:Control) -> void:
	for child_control:Control in control_to_purge.get_children():
		child_control.queue_free()
