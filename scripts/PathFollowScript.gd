extends PathFollow2D

export var speed = 400
var moving = false

signal busArrived

func _ready():
	get_node("bus").connect("busClicked",self,"_on_bus_clicked")
	get_node("bus").connect("busCrashed",self,"stop_moving")
	set_process(true)
	
func _on_bus_clicked():
	print("Bus starts moving.")
	moving = true
	
func stop_moving():
	moving = false
	
func _process(delta):
	if moving:
		set_offset(get_offset() + speed * delta)
	if get_unit_offset() > 0.99 and moving:
		emit_signal("busArrived")
		print("Bus has arrived.")		
		moving = false
		queue_free()