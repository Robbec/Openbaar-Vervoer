var bussesArrived = 0
var totalBusses = 0
onready var filename = get_tree().get_current_scene().get_filename()
var regexp = RegEx.new()
var level = 0
var measuring = false
var timer = 0

func _ready():
	get_viewport().queue_screen_capture()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var capture = get_viewport().get_screen_capture()
	capture.save_png("res://textures/screenshot.png")
	regexp.compile("\\level(.).tscn")
	regexp.find(filename)
	level = int(regexp.get_captures()[1])
	global.currentScene = level
	for bus in get_node("busContainer").get_children():
		print("A bus in the container.")
		totalBusses += 1
		bus.get_node("busPathFollow/bus").connect("busClicked",self,"_on_bus_clicked")
		bus.get_node("busPathFollow").connect("busArrived",self,"_on_bus_arrived")
	set_process(true)
	print(global.unlockedLevels)
	
func _on_bus_clicked():
	print("Start measuring time.")
	measuring = true

func _on_bus_arrived():
	print("Bus has arrived.")
	bussesArrived += 1
	if(bussesArrived == totalBusses):
		measuring = false
		print("All busses have arrived.")
		if(level != global.maxLevel):
			global.unlockedLevels[level] = true
		global._set_score(timer,level)
		global.localscore = timer
		HTTPLogging.add_record(timer,level,true)
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
	
func _process(delta):
	if(measuring):
		timer += delta
		get_node("screen/timerLabel").set_text(str("%.2f" % timer).replace(".",":"))