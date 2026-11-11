extends Control
class_name RewardChoice

@export var reward:Reward
@export_multiline var blurb:String
@export var texture_rect:TextureRect
@export var name_label:Label
@export var value_label:Label
@export var blurb_label:Label

var looks_cooler:bool = false

func _ready() -> void:
	setup()

func setup() -> void:
	if looks_cooler:
		value_label.modulate = Color.SKY_BLUE
	else:
		value_label.modulate = Color.WHITE
	
	texture_rect.texture = reward.image
	
	name_label.text = Stats.return_name(reward.stat) + ":"
	
	var text_to_set:String = str(reward.value)
	if reward.stat == Stats.Names.attack_speed_multiplier: text_to_set += "%"
	text_to_set = "+" + text_to_set
	value_label.text = text_to_set
	
	if blurb_label: blurb_label.text = blurb

func _on_button_pressed() -> void:
	BasicEvents.reward_chosen.emit(reward)
	BasicEvents.swap_to_combat_screen.emit()
