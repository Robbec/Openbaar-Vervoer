extends PathFollow2D

export var speed = 400
var moving = false

signal busArrived

func _ready():
	get_node("bus").connect("busClicked",self,"_on_bus_clicked")
	set_process(true)
	
func _on_bus_clicked():
	sound._play_sound("busDriving")
	moving = true
	print("Bus starts moving.")
	
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