extends Area2D

signal busClicked
signal busCrashed
var timer

func _ready():
	connect("area_enter",self,"_on_area_enter")
	
func _input_event(viewport, event, shape_idx):
	print("Input event registered.")
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		emit_signal("busClicked")
		print("Bus is clicked.")

func _on_area_enter(area):
	var bus = get_tree().get_root().get_node("main/busContainer").get_child(0)
	bus.get_node("SamplePlayer").play("carCrash")
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")
	emit_signal("busCrashed")
	if area.has_method("stop_playing"):
    area.stop_playing()
	timer = Timer.new()
	timer.connect("timeout",self,"on_timer_timeout")
	add_child(timer)
	timer.set_wait_time( 2 )
	timer.start()
	
func on_timer_timeout():
	get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")
