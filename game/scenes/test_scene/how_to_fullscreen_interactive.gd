extends Node2D

func _ready() -> void:
	setup_toggle_button_icon()
	get_window().size_changed.connect(setup_toggle_button_icon)

func _on_toogle_window_size_area_entered(_area: Area2D) -> void:
	$HowToFullscreen._on_toogle_full_screen_pressed()

func setup_toggle_button_icon():
	if $HowToFullscreen.is_fullscreen():
		$ToogleWindowSize/Sprite2D.texture = $HowToFullscreen.image_windowed
	else:
		$ToogleWindowSize/Sprite2D.texture = $HowToFullscreen.image_fullscreen
