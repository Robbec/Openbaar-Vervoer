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
	get_node("timerLabel").set_text(str("%.2f" % score).replace(".",":"))
		
func _pressed():
	global.level = level
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn");
	global.level = level
	