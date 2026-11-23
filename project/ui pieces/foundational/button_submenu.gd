extends TextureButton

@export var submenu:Control

var saved_tooltip_text:String

func _ready() -> void:
	if not submenu: push_error("did not assign export variable: 'submenu'")
	submenu.visible = false

func _on_pressed() -> void:
	match submenu.visible:
		false: show_submenu()
		true: hide_submenu()

func show_submenu() -> void:
	submenu.visible = true
	saved_tooltip_text = tooltip_text
	tooltip_text = ""

func hide_submenu() -> void:
	submenu.visible = false
	tooltip_text = saved_tooltip_text
