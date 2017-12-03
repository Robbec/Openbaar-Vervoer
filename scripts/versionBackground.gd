extends Sprite

func _ready():
	if (global.theme):
		print("Current level: " + str(global.level))
		set_texture(load("res://textures/level" + str(global.level) + ".png"))
	else:
		hide()