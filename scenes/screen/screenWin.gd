extends Sprite

onready var timerLabel = get_node("winText/timerLabel")

func _ready():
	print(timerLabel)
	timerLabel.time = global.localscore