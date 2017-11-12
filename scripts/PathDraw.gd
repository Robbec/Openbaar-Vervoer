extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var points

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	points = get_parent().get_curve().tesselate(5,3)
	for v in points:
		print(v)
	pass
	
func _draw():
	pass
