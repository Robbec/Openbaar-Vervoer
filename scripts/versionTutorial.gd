extends Label

func _ready():
	if (!global.theme):
		set_text(get_text().replace("bus","yellow rectangle"))