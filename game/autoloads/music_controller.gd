extends Node

# @onready var main_music = preload("uid://dur37h2g41vjo")
@onready var main_music = preload("res://assets/audio/music/Game Of Tutorials-looped-10_808.mp3")


var music_bus_index = AudioServer.get_bus_index("Music")
var sound_bus_index = AudioServer.get_bus_index("Sound")

func stop_music():
	$AudioStreamPlayer.stop()

func start_music():
	$AudioStreamPlayer.stream = main_music
	$AudioStreamPlayer.play()

func get_music_enable():
	return !AudioServer.is_bus_mute(music_bus_index)
	
func get_sound_enable():
	return !AudioServer.is_bus_mute(sound_bus_index)

func setup_music_enable(is_on):
	AudioServer.set_bus_mute(music_bus_index, !is_on)
	
func setup_sound_enable(is_on):
	AudioServer.set_bus_mute(sound_bus_index, !is_on)
