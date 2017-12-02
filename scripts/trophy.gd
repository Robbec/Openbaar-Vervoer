extends Sprite

var gold = preload("res://textures/3 sterren.png")
var silver = preload("res://textures/2 sterren.png")

func _ready():
	if(global.localscore < 6):
		set_texture(silver)
	if(global.localscore < 4):
		set_texture(gold)