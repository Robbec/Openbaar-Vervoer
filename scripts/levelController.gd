extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bussesArrived = 0
export var totalBusses = 1
var measuring = false

func bus_clicked():
	if(!measuring):
		measuring = true

func _busArrived():
	bussesArrived = bussesArrived + 1
	print("bus has arrived")
	if(bussesArrived == totalBusses):
		get_tree().change_scene("res://scenes/gameOver.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
