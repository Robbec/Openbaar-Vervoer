extends Button

export var level = 1

func _ready():
	if(global.Level[level]):
		set_disabled(false)
		
func _pressed():
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn");