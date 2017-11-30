extends Node
var localscore = 0
var maxLevel = 9
var currentScene
var unlockedLevels = Array()
var highscores = Array()
var save_data
var save_path = "res://config file/highScore.cfg" 
var savegame = ConfigFile.new()

func _ready():
	var file = File.new()
	if(!file.file_exists(save_path)):
		_create_new_save_file()
	else:
		savegame.load(save_path)
	var j = savegame.get_value("info","unlockedLevels")
	
	for i in range(j):
		unlockedLevels.append(true)
	for i in range(9-j):
		unlockedLevels.append(false)

func _set_score(value,index):
	var score = savegame.get_value("level","Level" + str(index) + "_Score")
	if(score == 0 || score > value):
		savegame.set_value("level","Level" + str(index) + "_Score",value)

func _create_new_save_file():
	savegame.set_value("info","unlockedLevels", 1)
	for i in range(9):
		savegame.set_value("level","Level" + str(i+1) + "_Score", 0)
	savegame.save(save_path)
	print("New save file created.")
	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		print(str(unlockedLevels.count(true)))
		savegame.set_value("info","unlockedLevels",unlockedLevels.count(true))
		savegame.save(save_path)
func _get_score(level):
	return savegame.get_value("level","Level" + str(level) + "_Score")