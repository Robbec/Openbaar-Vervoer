extends Area2D

signal busClicked

func _ready():
	connect("area_enter",self,"_on_area_enter")
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		emit_signal("busClicked")
		print("Bus is clicked.")

func _on_area_enter(area):
	sound._play_sound("carCrash")
	HTTPlogging.add_record(0,global.currentScene, false)
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")