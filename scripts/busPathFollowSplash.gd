extends PathFollow2D

export var speed = 400
onready var filename = get_tree().get_current_scene().get_name()

func _ready():
	set_process(true)
	
func _process(delta):
	set_offset(get_offset() + speed * delta)
	if (get_unit_offset() > 0.99):
		if (filename == "screenSplash"):
			get_tree().change_scene("res://scenes/mainMenu/mainMenu.tscn")
		else:
			set_offset(0)