extends CanvasLayer

var image_fullscreen = preload("uid://bsl16r8ox3uuv")
var image_windowed = preload("uid://b7nhxoy8rda7s")

func _ready() -> void:
	setup_toggle_button_icon()
	get_window().size_changed.connect(setup_toggle_button_icon)

func _on_full_screen_pressed() -> void:
	make_fullscreen()

func _on_window_pressed() -> void:
	make_windowed()

func _on_toogle_full_screen_pressed() -> void:
	if is_fullscreen():
		make_windowed()
	else:
		make_fullscreen()

func is_fullscreen():
	var mode = DisplayServer.window_get_mode()
	return mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN or mode == DisplayServer.WINDOW_MODE_FULLSCREEN
	
func make_fullscreen():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func make_windowed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func setup_toggle_button_icon():
	if is_fullscreen():
		$ToogleFullScreen.texture_normal = image_windowed
	else:
		$ToogleFullScreen.texture_normal = image_fullscreen
