extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	print(get_tree().get_root().get_node("main/busContainer/busPath/busPathFollow/bus").get_name())
	get_tree().get_root().get_node("main/busContainer/busPath/busPathFollow/bus").connect("busClicked",self,"_overlay_dissapear")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _overlay_dissapear():
	set_opacity(0)