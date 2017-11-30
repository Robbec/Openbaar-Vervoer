extends Sprite
var gold = preload("res://textures/goud.jpg")
var silver = preload("res://textures/zilver.jpg")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	if(global.localscore < 6):
		set_texture(silver)
	if(global.localscore < 4):
		set_texture(gold)
	pass
