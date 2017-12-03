extends Sprite

func _ready():
	if (global.theme):
		set_texture(load("res://textures/level" + str(global.level) + ".png"))
	else:
		hide()