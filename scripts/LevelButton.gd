extends Button

var gold = preload("res://textures/goudkleur.jpg")
var silver = preload("res://textures/zilverkleur.jpg")
var brons = preload("res://textures/bronskleur.jpg")
var gray = preload("res://textures/grijs.jpg")
onready var level = int(get_text())

func _ready():
	if(global.unlockedLevels[level-1]):
		set_disabled(false)
	var score = global._get_score(level)
	if(score == 0):
		_change_score_texture(gray)
	elif(score < 4):
		_change_score_texture(gold)
	elif(score < 6):
		_change_score_texture(silver)
	elif(score < 10):
		_change_score_texture(brons)
	get_node("timerLabel").set_text(str("%.2f" % score).replace(".",":"))
		
func _pressed():
	global.level = level
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn");
	
func _change_score_texture(texture):
		get_stylebox("normal","").set_texture(texture)
		get_stylebox("hover","").set_texture(texture)