extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var bus;
	if (global.theme):
		bus = "bus"
	else:
		bus = "yellow rectangle"
	set_text("Safely lead the " + bus + " to the other side of the screen. \n\n Press the " + bus + " once to start.")
