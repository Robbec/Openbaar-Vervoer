extends PathFollow2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var speed = 200
var moving = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
	pass
	
func set_moving(mov):
	moving = mov
	
func _process(delta):
	if moving:
		var currOffset = get_offset()
		set_offset(currOffset + speed * delta)
	if get_unit_offset() > .999 and moving:
		moving = false
		get_parent().get_parent()._busArrived()
