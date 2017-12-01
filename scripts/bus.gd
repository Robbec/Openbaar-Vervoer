extends Area2D

onready var animation = get_node("AnimationPlayer")
signal busClicked

func _ready():
	connect("area_enter",self,"_on_area_enter")
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		emit_signal("busClicked")
		animation.stop()
		print("Bus is clicked.")

func _on_area_enter(area):
	sound._play_sound("carCrash")
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")