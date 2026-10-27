extends Control

@export var reward:Reward
@export var texture_rect:TextureRect
@export var name_label:Label
@export var value_label:Label


func _ready() -> void:
	texture_rect.texture = reward.image
	
	name_label.text = Stats.return_name(reward.stat) + ":"
	
	var text_to_set:String = str(reward.value)
	if reward.stat == Stats.stats.attack_speed_multiplier: text_to_set += "%"
	
	value_label.text = text_to_set
