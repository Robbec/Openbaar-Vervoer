extends Path2D

var points
var colors = [Color(.5,.5,.5),Color("fcbb00"),Color("f32c08")]
var colorIndex = 0

func _ready():
	
	var children = get_parent().get_children()
	for i in range(children.size()):
		if children[i] == self:
			colorIndex = i
	pass
	
func _draw():
	get_curve().set_bake_interval(50)
	points = get_curve().get_baked_points()
	points.remove(points.size()-1)
	for v in points:
		draw_circle(v,4,colors[colorIndex])