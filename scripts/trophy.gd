extends Sprite
var gold = preload("res://textures/goud.jpg")
var silver = preload("res://textures/zilver.jpg")

func _ready():
	if(global.localscore < 6):
		set_texture(silver)
	if(global.localscore < 4):
		set_texture(gold)