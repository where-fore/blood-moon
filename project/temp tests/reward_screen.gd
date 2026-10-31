extends PanelContainer

@export var reward_buttons:Array[RewardChoice]
@export var basic_rewards:Array[Reward]
@export var rare_rewards:Array[Reward]


func _ready() -> void:
	visibility_changed.connect(randomize_options)

func randomize_options() -> void:
	var rare_chance:int = 30
	if randi_range(0,100) <= rare_chance:
		reward_buttons[0].reward = rare_rewards.pick_random()
		reward_buttons[0].looks_cooler = true
	else:
		reward_buttons[0].reward = basic_rewards.pick_random()
		reward_buttons[0].looks_cooler = false
	
	for button:RewardChoice in reward_buttons:
		if not reward_buttons[0]:
			button.reward = basic_rewards.pick_random()
	
	for button:RewardChoice in reward_buttons:
		button.setup()
