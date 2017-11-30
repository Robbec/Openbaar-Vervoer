extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_text(str("%.2f" % global.localscore))
	
	pass
