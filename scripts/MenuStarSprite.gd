extends Sprite
var star0 = preload("res://textures/0 sterren.png")
var star1 = preload("res://textures/1 sterren.png")
var star2 = preload("res://textures/2 sterren.png")
var star3 = preload("res://textures/3 sterren.png")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var level = int(get_parent().get_text())
	print(global._get_score(level))
	if(global._get_score(level) == 0 || global._get_score(level) > 8):
		set_texture(star0)
	elif(global._get_score(level) < 4):
		set_texture(star3)
	elif(global._get_score(level) < 6):
		set_texture(star2)
	else:
		set_texture(star1)
	pass
	# Called every time the node is added to the scene.
	# Initialization here
	pass