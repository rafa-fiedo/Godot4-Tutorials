extends CanvasLayer

var image_fullscreen = preload("uid://bsl16r8ox3uuv")
var image_windowed = preload("uid://b7nhxoy8rda7s")

func _ready() -> void:
	setup_toggle_icon()
	get_window().size_changed.connect(setup_toggle_icon)

func _on_full_screen_pressed() -> void:
	setup_fullscreen()

func _on_window_pressed() -> void:
	setup_windowed()

func _on_toggle_full_screen_pressed() -> void:
	if is_fullscreen():
		setup_windowed()
	else:
		setup_fullscreen()
		
	setup_toggle_icon()
	
func setup_fullscreen():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func setup_windowed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func setup_toggle_icon():
	if is_fullscreen():
		$ToggleFullScreen.texture_normal = image_windowed
	else:
		$ToggleFullScreen.texture_normal = image_fullscreen

func is_fullscreen():
	var mode = DisplayServer.window_get_mode()
	if mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		return true
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		return true
	
	return false
	
