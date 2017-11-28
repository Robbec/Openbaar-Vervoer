extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_tree().get_current_scene().get_node("main").connect("busClicked",self,"_overlay_dissapear")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _overlay_dissapear():
	print("a")
	set_opacity(0)