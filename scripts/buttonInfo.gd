extends TextureButton

func _ready():
	pass
	
func _pressed():
	get_tree().change_scene("res://scenes/screen/screenInfo.tscn")
	print("Go to info screen.")