var bussesArrived = 0
var totalBusses = 0
export var level = 1
var measuring = false
var timer = 0
#var screensize

#onready var bus = preload("res://scenes/Bus.tscn")

func _ready():
	#screensize = get_viewport().get_rect().size
	global.currentScene = level
	#create_busses(totalBusses)
	for bus in get_node("busContainer").get_children():
		print("A bus in the container.")
		totalBusses += 1
		bus.get_node("padBus/bus").connect("busClicked",self,"_on_bus_clicked")
		bus.get_node("padBus").connect("busArrived",self,"_on_bus_arrived")
	set_process(true)
	
#func create_busses(num):
#	for i in range(num):
#		var b = bus.instance()
#		busContainer.add_child(b)
#		b.set_pos(Vector2(screensize.width / (num+1) * (i+1), screensize.height - 140))

func _on_bus_clicked():
	print("Start measuring time.")
	measuring = true

func _on_bus_arrived():
	print("Start arrived")
	bussesArrived += 1
	if(bussesArrived == totalBusses):
		print("All busses have arrived.")
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
		global.Level[level+1] = true
		measuring = false
		print(timer)
	
func _process(delta):
	if(measuring):
		timer += delta
		get_node("screen/timerLabel").set_text(str("%.2f" % timer))
