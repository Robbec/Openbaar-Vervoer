extends Label

func _ready():
	if(global._is_new_highscore()):
		set_text("NEW HIGHSCORE!")