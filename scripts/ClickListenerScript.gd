extends Area2D

signal busClicked

func _ready():
	connect("area_enter",self,"_on_area_enter")
	
func _input_event(viewport, event, shape_idx):
	var capture = get_viewport().get_screen_capture()
	capture.save_png("res://textures/screenshot.png")
	print("Input event registered.")
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		emit_signal("busClicked")
		print("Bus is clicked.")

func _on_area_enter(area):
	get_tree().get_root().get_node("main/busContainer/busPath/SamplePlayer").play("carCrash")
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")