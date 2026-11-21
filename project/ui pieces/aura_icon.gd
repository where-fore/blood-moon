extends TextureRect
class_name AuraIcon

var aura_to_display:Reward:
	set(value):
		aura_to_display = value
		refresh_display()

func refresh_display() -> void:
	texture = aura_to_display.image
	tooltip_text = str(aura_to_display.value)
