var bussesArrived = 0
var totalBusses = 0
var measuring = false
var timer = 0
var crashed = false

func _ready():
	for bus in get_node("busContainer").get_children():
		totalBusses += 1
		bus.get_node("busPathFollow/bus").connect("busClicked",self,"_on_bus_clicked")
		bus.get_node("busPathFollow").connect("busArrived",self,"_on_bus_arrived")
		bus.get_node("busPathFollow/bus").connect("busCrashed",self,"_on_bus_crashed")
	set_process(true)
	
func _on_bus_clicked():
	print("Bus is clicked.")
	measuring = true

func _on_bus_arrived():
	print("Bus has arrived.")
	bussesArrived += 1
	if (bussesArrived == totalBusses):
		measuring = false
		print("All busses have arrived.")
		if(global.level != global.maxLevel):
			global.unlockedLevels[global.level] = true
		global._set_score(timer,global.level)
		global.localscore = timer
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
		HTTPLogging.add_record(timer,true)

func _on_bus_crashed():
	if (crashed == false):
		crashed = true
		print("Bus crashed.")
		sound._play_sound("carCrash")
		HTTPLogging.add_record(0,false)
		get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")

func _process(delta):
	if (measuring):
		timer += delta
		get_node("menu/timerLabel").set_text(str("%.2f" % timer).replace(".",":"))
	if (timer >= 99):
		get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")