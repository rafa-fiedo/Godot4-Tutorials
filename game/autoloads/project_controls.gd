extends Node

func _unhandled_key_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("toggle_fullscreen"):
		toggle_fullscreen()

func toggle_fullscreen():
	var mode = DisplayServer.window_get_mode()
	var is_fullscreen = mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN or mode == DisplayServer.WINDOW_MODE_FULLSCREEN
	
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func set_audio_master(is_on):
	AudioServer.set_bus_mute(0, not is_on)

func is_audio_master_on():
	return !AudioServer.is_bus_mute(0)
