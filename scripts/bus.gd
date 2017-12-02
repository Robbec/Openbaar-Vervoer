extends Area2D

signal busClicked
signal busCrashed

func _ready():
	connect("area_enter",self,"_on_area_enter")
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		emit_signal("busClicked")

func _on_area_enter(area):
	emit_signal("busCrashed")