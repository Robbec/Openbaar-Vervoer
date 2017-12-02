extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if(global._is_new_highscore()):
		set_text("NEW HIGHSCORE!!")
	pass
