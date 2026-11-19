extends Panel

@onready var label:RichTextLabel = $RichTextLabel

var delay_before_fading:float = 1.5
var fade_duration:float = 3
var typewriter_characters_per_second:int = 16

var current_text_uncovering_tween:Tween
var current_visibility_tween:Tween

func _ready() -> void:
	BasicEvents.send_basic_message.connect(send_basic_message)
	
	label.text = ""
	self.modulate = Color(0,0,0,0)
	
	visible = true

func send_basic_message(message:String) -> void:
	await scroll_text(message)

func scroll_text(new_text:String) -> void:
	_stop_text_scroll()
	_stop_text_fade()
	
	label.visible_characters = 0
	self.modulate = Color(1,1,1,1)
	
	label.text = new_text
	
	var total_characters:int = label.get_total_character_count()
	var duration:float = float(total_characters) / float(typewriter_characters_per_second)
	
	current_text_uncovering_tween = create_tween()
	current_text_uncovering_tween.tween_property(label, "visible_characters", total_characters, duration)
	
	await current_text_uncovering_tween.finished
	await get_tree().create_timer(delay_before_fading).timeout
	_fade_text()

func _fade_text() -> void:
	current_visibility_tween = create_tween()
	current_visibility_tween.set_trans(Tween.TRANS_QUINT)
	current_visibility_tween.set_ease(Tween.EASE_IN)
	current_visibility_tween.tween_property(self, "modulate", Color(0,0,0,0), fade_duration)

func _stop_text_fade() -> void:
	if current_visibility_tween:
		current_visibility_tween.stop()
		modulate = Color(1,1,1,1)

func _stop_text_scroll() -> void:
	if current_text_uncovering_tween:
		current_text_uncovering_tween.stop()
		label.visible_characters = 0
