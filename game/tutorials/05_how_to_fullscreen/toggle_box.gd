extends Area2D

var image_fullscreen = preload("uid://bsl16r8ox3uuv")
var image_windowed = preload("uid://b7nhxoy8rda7s")

func _ready() -> void:
	setup_toggle_icon()
	get_window().size_changed.connect(setup_toggle_icon)

func _on_area_entered(_attack_area: Area2D) -> void:
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
		$Sprite2D.texture = image_windowed
	else:
		$Sprite2D.texture = image_fullscreen

func is_fullscreen():
	var mode = DisplayServer.window_get_mode()
	if mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		return true
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		return true
	
	return false
	
