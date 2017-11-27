extends Node

var currentScene
var unlockedLevels = Array()

func _ready():
	unlockedLevels.append(true)
	for i in range(8):
		unlockedLevels.append(false)