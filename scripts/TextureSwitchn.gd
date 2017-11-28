extends TextureButton
var soundOff = preload("res://textures/audioOff.png")
var soundOn = preload("res://textures/audioOn.png")
var sound = true

func _ready():
	pass
	
func _pressed():
	if(sound):
		AudioServer.set_fx_global_volume_scale(10)
		set_normal_texture(soundOff)
		sound = false
	else:
		AudioServer.set_fx_global_volume_scale(0)
		set_normal_texture(soundOn)
		sound = true
	