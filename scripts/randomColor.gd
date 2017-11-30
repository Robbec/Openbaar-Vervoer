extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize();
	var r = rand_range(0, 1);
	var g = rand_range(0, 1);
	var b = rand_range(0, 1);
	set_modulate(Color(r, g, b, 0.25));