extends Label

onready var timer = get_node("timerLabel")

func _ready():
	timer.set_text("Time: " + str("%.2f" % global.localscore).replace(".",":"))