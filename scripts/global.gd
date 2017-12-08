extends Node

var theme
var localscore = 0
var maxLevel = 9
var level
var unlockedLevels
var scores = Array()
var save_data
var save_path = "user://highScore.dat"
var _user_data = {}
var highscore = false
var _starscore_data = {}
var star2scores = [5,5,5,4,4,5,6,5,6]
var star3scores = [4,4,4,3,3,4,4,4,5]

func _ready():
	for i in range(9):
	 	_starscore_data["level" + str(i+1) + "_star2"] = star2scores[i]
	 	_starscore_data["level" + str(i+1) + "_star3"] = star3scores[i]
	load_data(save_path,_user_data)
	theme = _user_data["theme"]
	unlockedLevels = _user_data["unlockedLevels"]

func _set_score(value,index):
	var score = _user_data["Level" + str(index) + "_Score"]
	if(score == 0 || score > value):
		_user_data["Level" + str(index) + "_Score"] = value
		_user_data["unlockedLevels"] = unlockedLevels
		highscore = true
	save_data(save_path,_user_data)

func _make_default_data():
	_user_data["unlockedLevels"] = 1
	_user_data["theme"] = use_theme()
	for i in range(9):
		_user_data["Level" + str(i+1) + "_Score"] = 0
	return _user_data
	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		_user_data["unlockedLevels"] = unlockedLevels
		save_data(save_path,_user_data)

func _get_score(level):
	return _user_data["Level" + str(level) + "_Score"]
	
func _get_star_value(stars,level):
	return _starscore_data["level" + str(level) + "_star"  + str(stars)]
	
func use_theme():
    randomize()
    return randi() % 2 == 0

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
	_check_correctness_data()
	f.close()

func _parse_loaded_data(loaded_data,data):
    for key in data.keys():
        loaded_data[key] = data[key]

func _check_correctness_data():
	var j = 0
	while(j < 9 &&  _get_score(j+1) != 0 ):
		j = j + 1
	if(j != _user_data["unlockedLevels"]):
		if(_user_data["unlockedLevels"] == 1 && j == 0):
			return
		elif(j!=9):
			j = j + 1
			_user_data["unlockedLevels"] = j
		else:
			_user_data["unlockedLevels"] = j
	
	
	