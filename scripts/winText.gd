extends Label

onready var timer = get_node("timerLabel")

func _ready():
	timer.set_text("Time: " + timer.get_text())