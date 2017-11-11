extends TextureButton
var soundOff = preload("res://textures/soundOff.png")
var soundOn = preload("res://textures/soundOn.png")
var sound = true
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _pressed():
	if(sound):
		set_normal_texture(soundOff)
		sound = false
	else:
		set_normal_texture(soundOn)
		sound = true
	