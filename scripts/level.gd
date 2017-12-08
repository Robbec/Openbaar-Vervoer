var bussesArrived = 0
var totalBusses = 0
var measuring = false
var timer = 0
var crashed = false
var startTimer = 0
var level = global.level

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
		global._set_score(timer,level)
		global.localscore = timer
		get_tree().change_scene("res://scenes/screen/screenWin.tscn")
		HTTPLogging.add_record(timer,true,startTimer)

func _on_bus_crashed():
	if (crashed == false):
		crashed = true
		print("Bus crashed.")
		if global.theme:
			sound._play_sound("carCrash")
		else:
			sound._play_sound("noThemeCrash")
		HTTPLogging.add_record(timer,false,startTimer)
		get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")

func _process(delta):
	if (!measuring && timer == 0):
		startTimer += delta
	if (measuring):
		timer += delta
		get_node("menu/timerLabel").set_text(str("%.2f" % timer).replace(".",":"))
	if (timer >= 99):
		HTTPLogging.add_record(timer,false,startTimer)
		get_tree().change_scene("res://scenes/screen/screenGameOver.tscn")