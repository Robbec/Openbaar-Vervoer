extends TextureButton

func _ready():
	pass

func _pressed():
	global.level += 1
	get_tree().change_scene("res://scenes/level/level"+str(global.level)+".tscn")
	print("Go to next level.")