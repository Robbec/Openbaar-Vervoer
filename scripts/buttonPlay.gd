extends Button

func _ready():
	pass
	
func _pressed():
	get_tree().change_scene("res://scenes/mainMenu/mainMenu.tscn")
	print("Start to play.")