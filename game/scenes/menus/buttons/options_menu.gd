extends CanvasLayer

@export var is_main_menu := false
@export var youtube_link := "https://www.youtube.com/rafafiedo"

var main_menu_uid = "uid://c23apbpii8nbk"

func _ready() -> void:
	setup_all_buttons(false)
	%Sound.button_pressed = MusicController.get_sound_enable()
	%Music.button_pressed = MusicController.get_music_enable()

func _on_youtube_pressed() -> void:
	OS.shell_open(youtube_link)

func _on_pause_toggled(toggled_on: bool) -> void:
	%OptionsBackground.button_pressed = toggled_on
	$Background.visible = toggled_on
	get_tree().paused = toggled_on
	setup_all_buttons(toggled_on)

func _on_sound_toggled(toggled_on: bool) -> void:
	MusicController.setup_sound_enable(toggled_on)

func _on_music_toggled(toggled_on: bool) -> void:
	MusicController.setup_music_enable(toggled_on)
	
func _on_full_screen_pressed() -> void:
	ProjectControls.toggle_fullscreen()
	
func _on_back_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(main_menu_uid)

func _on_info_pressed() -> void:
	$InfoMargin.visible = !$InfoMargin.visible
	# show info like youtube page, author, etc etc
	pass # Replace with function body.

func setup_all_buttons(is_on):
	%Sound.visible = is_on
	%Music.visible = is_on
	%FullScreen.visible = is_on
	%Back.visible = is_on and not is_main_menu
	%Info.visible = is_on and is_main_menu
	$Background.visible = is_on
	$InfoMargin.visible = false
