extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("area_enter",self,"_on_area_enter")
	pass
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		get_parent().set_moving(true)
		get_parent().get_parent().get_parent().bus_clicked()

func _on_area_enter(area):
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")