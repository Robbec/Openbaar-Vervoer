extends Button

onready var level = int(get_text())

func _ready():
	if(global.unlockedLevels[level-1]):
		set_disabled(false)
		
func _pressed():
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn");