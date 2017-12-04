extends TextureButton
var soundOff = preload("res://textures/audioOff-small.png")
var soundOn = preload("res://textures/audioOn-small.png")

func _ready():
	if(!sound.music):
		set_normal_texture(soundOff)
	else:
		set_normal_texture(soundOn)

func _pressed():
	if(!sound.music):
		sound._unmute()
		set_normal_texture(soundOn)
	else:
		sound._mute()
		set_normal_texture(soundOff)