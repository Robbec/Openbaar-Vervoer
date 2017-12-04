extends Node
var theme = false
var localscore = 0
var maxLevel = 9
var level
var unlockedLevels = Array()
var scores = Array()
var save_data
var save_path = "user://highScore.dat" 
var starscore = File.new()
var savegame = File.new()
var _user_data = {}
var highscore = false
var _starscore_data = {}

func _ready():
	for i in range(9):
	 	_starscore_data["level" + str(i+1) + "_star2"] = 5
	 	_starscore_data["level" + str(i+1) + "_star3"] = 4
	_starscore_data["level" + str(4) + "_star2"] = 4
	_starscore_data["level" + str(5) + "_star2"] = 4
	_starscore_data["level" + str(7) + "_star2"] = 6
	_starscore_data["level" + str(9) + "_star2"] = 6
	_starscore_data["level" + str(4) + "_star3"] = 3
	_starscore_data["level" + str(5) + "_star3"] = 3
	_starscore_data["level" + str(9) + "_star3"] = 5
	load_data(save_path,_user_data)

	print(_user_data.keys().size())
	var j = _user_data["unlockedLevels"]
	theme = _user_data["theme"]
	for i in range(j):
		unlockedLevels.append(true)
	for i in range(9-j):
		unlockedLevels.append(false)

func _set_score(value,index):
	var score = _user_data["Level" + str(index) + "_Score"]
	if(score == 0 || score > value):
		_user_data["Level" + str(index) + "_Score"] = value
		highscore = true

func _make_default_data():
	_user_data["unlockedLevels"] = 1
	_user_data["theme"] = (get_random_number() == 0)
	for i in range(9):
		_user_data["Level" + str(i+1) + "_Score"] = 0
#	savegame.set_value("info","unlockedLevels", 1)
#	savegame.set_value("info","theme", get_random_number() == 0)
#	for i in range(9):
#		savegame.set_value("level","Level" + str(i+1) + "_Score", 0)
	return _user_data
	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		_user_data["unlockedLevels"] = unlockedLevels.count(true)
		save_data(save_path,_user_data)

func _get_score(level):
	return _user_data["Level" + str(level) + "_Score"]
	
func _get_star_value(stars,level):
	return _starscore_data["level" + str(level) + "_star"  + str(stars)]
	
func get_random_number():
    randomize()
    return randi() % 2

func save_data(path,data):
    var f = File.new()
    f.open(path,File.WRITE)
    f.store_string(data.to_json())
    f.close()

func load_data(path,loaded_data):
    var f = File.new()
    if(not f.file_exists(path)):
        save_data(path,_make_default_data())
    f.open(path, File.READ)
    var data = {}
    data.parse_json(f.get_as_text())
    _parse_loaded_data(loaded_data,data)
    f.close()

func _parse_loaded_data(loaded_data,data):
    for key in data.keys():
        loaded_data[key] = data[key]
