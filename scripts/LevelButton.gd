extends Button

onready var level = int(get_text())

func _ready():
	var score = global._get_score(level)
	if (level == 1 || score == 0 && level != 1 && global._get_score(level - 1) != 0):
		set_disabled(false)
	elif (score == 0):
		get_node("timerLabel").set_text("-:--")
	else:
		get_node("timerLabel").set_text(str("%.2f" % score).replace(".",":"))
		set_disabled(false)

func _pressed():
	global.level = level
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn")