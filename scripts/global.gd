extends Node

var currentScene
var unlockedLevels = Array()
var scores = Array()
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
	print("Level" + str(index) + "_Score")
	var score = savegame.get_value("level","Level" + str(index) + "_Score")
	if(score == 0 || score > value):
		savegame.set_value("level","Level" + str(index) + "_Score",value)

func _create_new_save_file():
	savegame.set_value("info","unlockedLevels", 1)
	savegame.set_value("level","Level1_Score", 0)
	savegame.set_value("level","Level2_Score", 0)
	savegame.set_value("level","Level3_Score", 0)
	savegame.set_value("level","Level4_Score", 0)
	savegame.set_value("level","Level5_Score", 0)
	savegame.set_value("level","Level6_Score", 0)
	savegame.set_value("level","Level7_Score", 0)
	savegame.set_value("level","Level8_Score", 0)
	savegame.set_value("level","Level9_Score", 0)
	savegame.save(save_path)
	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		print(str(unlockedLevels.count(true)))
		savegame.set_value("info","unlockedLevels",unlockedLevels.count(true))
		savegame.save(save_path)