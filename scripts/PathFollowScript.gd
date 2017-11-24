extends PathFollow2D

export var speed = 400
var moving = false
signal busArrived

func _ready():
	get_node("bus").connect("busClicked",self,"_on_bus_clicked")
	set_process(true)
	
func _on_bus_clicked():
	moving = true
	
func _process(delta):
	if moving:
		set_offset(get_offset() + speed * delta)
	if get_unit_offset() > .999 and moving:
		moving = false
		emit_signal("busArrived")