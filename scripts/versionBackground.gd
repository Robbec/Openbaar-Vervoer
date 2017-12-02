extends Sprite


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if (global.theme):
		print("background loaded " + str(global.currentScene));
		set_texture(load("res://textures/level"+"1"+".png"))
