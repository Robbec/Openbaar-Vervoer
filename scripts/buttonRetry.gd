func _ready():
	pass
	
func _pressed():
	get_tree().change_scene("res://scenes/level/level"+str(global.currentScene)+".tscn")
	print("Retry level.")