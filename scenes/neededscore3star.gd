extends Label

export var amountofstars = 0
func _ready():
	set_text(str(global._get_star_value(amountofstars,global.level)) + ":00")
	pass
