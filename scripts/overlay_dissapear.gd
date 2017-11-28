extends Sprite

func _ready():
	get_tree().get_root().get_node("main/busContainer/busPath/busPathFollow/bus").connect("busClicked",self,"_overlay_dissapear")
	set_opacity(0.8)
	
func _overlay_dissapear():
	set_opacity(0)