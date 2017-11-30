extends Label

func _ready():
	if (get_text() == "0"):
		set_text("0.00")
	set_text(get_text().replace(".",":"))