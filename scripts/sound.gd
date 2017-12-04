extends Node

var player = SamplePlayer.new()
var sampleCarCrash = preload("res://sounds/carCrash.smp")
var sampleBusStarting = preload("res://sounds/busStarting.smp")
var sampleBusDriving = preload("res://sounds/busDriving.smp")
var sampleSuccess = preload("res://sounds/busHorn.smp")
var sampleNoThemeSucces = preload("res://sounds/196106__aiwha__ding2.smp")
var sampleNoThemeMoving = preload("res://sounds/158922__carlmartin__jembay-hit-1-hi-rim.smp")
var sampleNoThemeCrash = preload("res://sounds/hit2.smp")
var music = true
var library = SampleLibrary.new()

func _ready():
	library.add_sample("carCrash", sampleCarCrash);
	#library.add_sample("busStarting", sampleBusStarting);
	library.add_sample("busDriving", sampleBusDriving);
	library.add_sample("win",sampleSuccess)
	library.add_sample("noThemeCrash", sampleNoThemeCrash);
	library.add_sample("noThemeMoving", sampleNoThemeMoving);
	library.add_sample("noThemeWin", sampleNoThemeSucces);
	player.set_sample_library(library);

func _play_sound(filename):
	if(music):
		player.play(filename);
	
func _mute():
	music = false;

func _unmute():
	music = true;