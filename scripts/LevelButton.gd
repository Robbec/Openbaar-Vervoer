extends Button

onready var level = int(get_text())

func _ready():
	if(global.unlockedLevels[level-1]):
		set_disabled(false)
	var score = global._get_score(level)
	get_node("timerLabel").set_text(str("%.2f" % score).replace(".",":"))

func _pressed():
	global.level = level
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn")