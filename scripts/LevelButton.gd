extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var level = 1
func _ready():
	if(global.Level[level]):
		set_disabled(false)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _pressed():
	get_tree().change_scene("res://scenes/level/level" + str(level) + ".tscn");
	