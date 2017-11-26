extends TextureButton
var soundOff = preload("res://textures/soundOff.png")
var soundOn = preload("res://textures/soundOn.png")
var mute

func _ready():
	mute = !sound.music
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
	