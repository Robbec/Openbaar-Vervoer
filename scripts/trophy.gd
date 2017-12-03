extends Sprite

var gold = preload("res://textures/3 sterren.png")
var silver = preload("res://textures/2 sterren.png")
var brons = preload("res://textures/1 sterren.png")
var nothing = preload("res://textures/0 sterren.png")
onready	var star1 = global._get_star_value(1,global.level) 
onready var star2 = global._get_star_value(2,global.level)
onready	var star3 = global._get_star_value(3,global.level)

func _ready():
	sound._play_sound("win")
	if(global.localscore < star3):
		set_texture(gold)
	elif(global.localscore < star2):
		set_texture(silver)
	elif(global.localscore < star1):
		set_texture(brons)
	else:
		set_texture(nothing)