extends Sprite
var gold = preload("res://textures/3 sterren.png")
var silver = preload("res://textures/2 sterren.png")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	if(global.localscore < 6):
		set_texture(silver)
	if(global.localscore < 4):
		set_texture(gold)
	pass
