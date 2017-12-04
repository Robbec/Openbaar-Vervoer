extends Sprite
var bus = preload("res://textures/freebus.png")
var noBus = preload("res://textures/noBus.png")

func _ready():
	if (global.theme):
		set_texture(bus)
	else:
		set_texture(noBus)