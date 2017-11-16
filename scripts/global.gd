extends Node

var currentScene
var Level = Array()

func _ready():
	Level.append(true)
	for i in range(1,8):
		Level.append(false)