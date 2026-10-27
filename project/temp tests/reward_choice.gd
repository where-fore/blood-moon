extends Control

@export var image:Texture
@export var stat:String
@export var value:int
@export var value_speed:float
@export var texture_rect:TextureRect
@export var name_label:Label
@export var value_label:Label


func _ready() -> void:
	texture_rect.texture = image
	
	name_label.text = stat + ":"
	
	var text_to_set:String
	if value:
		text_to_set = str(value)
	elif value_speed:
		text_to_set = str(value_speed)
	else:
		push_error("neither value or value_speed were set for: ", name)
	value_label.text = text_to_set
