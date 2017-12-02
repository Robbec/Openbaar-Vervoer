extends Sprite
var bus = preload("res://textures/freebus.png")
var noBus = preload("res://textures/noBus.png")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if (global.theme):
		set_texture(bus);
	else:
		set_texture(noBus);
