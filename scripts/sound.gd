extends Node

var player = SamplePlayer.new()
var sample = preload("res://sounds/carCrash.smp")
var music = true
var library = SampleLibrary.new()

func _ready():
	library.add_sample("carCrash", sample);
	player.set_sample_library(library);

func _play_sound(filename):
	if(music):
		player.play(filename);
	
func _mute():
	music = false;

func _unmute():
	music = true;
