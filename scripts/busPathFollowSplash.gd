extends PathFollow2D

export var speed = 400

func _ready():
	if (get_tree().get_current_scene().get_name() != "screenSplash"):
		sound._play_sound("busDriving")
	set_process(true)
	
func _process(delta):
	set_offset(get_offset() + speed * delta)