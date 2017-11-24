extends TextureButton
var soundOff = preload("res://textures/soundOff.png")
var soundOn = preload("res://textures/soundOn.png")
var sound = true

func _ready():
	pass
	
func _pressed():
	if(sound):
		set_normal_texture(soundOff)
		sound = false
	else:
		set_normal_texture(soundOn)
		sound = true
	