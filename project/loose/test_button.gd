extends TextureButton

@export var submenu:Control

func _ready() -> void:
	submenu.visible = false

func _on_pressed() -> void:
	submenu.visible = !submenu.visible
