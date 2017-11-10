extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screen_size

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screen_size = get_viewport_rect().size
	print("ready")
	set_process(true)
	pass
	
func _process(delta):
	var pos = get_pos()
	var vel = Vector2()
	if (Input.is_action_pressed("move_up")):
		vel = Vector2(0,-1)
	if (Input.is_action_pressed("move_down")):
		vel = Vector2(0,1)
	set_pos(pos + vel * 100 * delta);
