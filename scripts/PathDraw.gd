extends Path2D

var points

func _ready():
	pass
	
func _draw():
	get_curve().set_bake_interval(50)
	points = get_curve().get_baked_points()
	for v in points:
		draw_circle(v,4,Color(.5,.5,.5))