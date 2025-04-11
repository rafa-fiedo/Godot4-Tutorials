extends Node

@onready var main_music = preload("uid://dur37h2g41vjo")

func stop_music():
	$AudioStreamPlayer.stop()

func start_music():
	$AudioStreamPlayer.stream = main_music
	$AudioStreamPlayer.play()

func setup_music_enable(is_on):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), !is_on)
	
func setup_sound_enable(is_on):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound"), !is_on)
