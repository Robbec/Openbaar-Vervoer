extends Label

func _ready():
	if(global.highscore):
		set_text("NEW HIGHSCORE!")