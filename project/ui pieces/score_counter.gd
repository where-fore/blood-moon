extends Label

var current_score:int = 0:
	set(value):
		current_score = value
		update_text_with_score()

func _ready() -> void:
	update_text_with_score()
	
	BasicEvents.player_lost.connect(clear_score)
	BasicEvents.swap_to_reward_screen.connect(increment_score)

func increment_score() -> void:
	current_score += 1

func clear_score() -> void:
	current_score = 0

func update_text_with_score() -> void:
	text = str(current_score)
