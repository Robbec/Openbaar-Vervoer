var bussesArrived = 0
var totalBusses = 0
onready var filename = get_tree().get_current_scene().get_filename()
var regexp = RegEx.new()
var level = 0
var measuring = false
var timer = 0

func _ready():
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
	emit_signal("busClicked")
	print("Start measuring time.")
	measuring = true

func _on_bus_arrived():
	print("Start arrived")
	bussesArrived += 1
	if(bussesArrived == totalBusses):
		print("All busses have arrived.")
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
		global.unlockedLevels[level] = true
		measuring = false
		print(timer)
		global._set_score(timer,level)
	
func _process(delta):
	if(measuring):
		timer += delta
		get_node("screen/timerLabel").set_text(str("%.2f" % timer))