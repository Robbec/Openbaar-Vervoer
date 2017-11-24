
var bussesArrived = 0
export var totalBusses = 1
export var level = 1
var measuring = false
var timer = 0

func bus_clicked():
	if(!measuring):
		measuring = true

func _busArrived():
	bussesArrived = bussesArrived + 1
	print("bus has arrived")
	if(bussesArrived == totalBusses):
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
		global.Level[level+1] = true
		measuring = false
		print(timer)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	global.currentScene = level
	set_process(true)
	
	pass
	
func _process(delta):
	if(measuring):
		timer += delta
		get_node("UILayer").get_node("TimerLabel").set_text(String(timer))
