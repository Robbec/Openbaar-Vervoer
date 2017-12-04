extends Label

func _ready():
	if(global.highscore):
		global.highscore = false
		set_text("NEW HIGHSCORE!")