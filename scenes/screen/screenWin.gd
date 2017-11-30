extends Sprite

onready var timerLabel = get_node("winText/timerLabel")

func _ready():
	print(timerLabel)
#	timerLabel.set_text(str("%.2f" % global.localscore))