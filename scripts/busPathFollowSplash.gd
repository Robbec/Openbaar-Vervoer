extends PathFollow2D

export var speed = 400

func _ready():
	sound._play_sound("busDriving")
	set_process(true)
	
func _process(delta):
	set_offset(get_offset() + speed * delta)