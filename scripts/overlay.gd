extends Sprite

func _ready():
	get_tree().get_root().get_node("level/busContainer/busPath/busPathFollow/bus").connect("busClicked",self,"_overlay_disappear")
	set_opacity(0.8)
	
func _overlay_disappear():
	set_opacity(0)