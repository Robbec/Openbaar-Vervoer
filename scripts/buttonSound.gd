extends TextureButton
var soundOff = preload("res://textures/audioOffSmall.png")
var soundOn = preload("res://textures/audioOnSmall.png")
var mute = !sound.music

func _ready():
	if(mute):
		set_normal_texture(soundOff)
	else:
		set_normal_texture(soundOn)
	pass
	
func _pressed():
	if(mute):
		sound._unmute()
		set_normal_texture(soundOn)
		mute = false
	else:
		sound._mute()
		set_normal_texture(soundOff)
		mute = true
	