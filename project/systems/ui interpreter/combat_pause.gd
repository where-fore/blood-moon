extends TextureButton

@export var play_texture:Texture
@export var pause_texture:Texture

var paused:bool = true:
	set(value):
		paused = value
		update_texture()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_texture()

func on_pressed() -> void:
	paused = !paused

func update_texture() -> void:
	match paused:
		true: texture_normal = pause_texture
		false: texture_normal = play_texture
