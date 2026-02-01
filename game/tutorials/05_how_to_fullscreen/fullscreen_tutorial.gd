extends Node2D

var image_fullscreen = preload("res://assets/sprites/interactive/button_fullscreen.png")
var image_windowed = preload("res://assets/sprites/interactive/button_window.png")

func _ready() -> void:
	setup_toggle_icon()
	get_window().size_changed.connect(setup_toggle_icon)

func _on_toggle_fullscreen_pressed() -> void:
	if is_fullscreen_mode_active():
		do_windowed()
	else:
		do_fullscreen()
		
	setup_toggle_icon()
		
func setup_toggle_icon():
	if is_fullscreen_mode_active():
		$ToggleFullscreen.texture_normal = image_windowed
	else:
		$ToggleFullscreen.texture_normal = image_fullscreen

func do_fullscreen() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func do_windowed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
func is_fullscreen_mode_active():
	var mode = DisplayServer.window_get_mode()
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		return true
	if mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		return true
	return false
