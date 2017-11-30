extends Label

func _ready():
	set_text(get_text().replace(".",":"))