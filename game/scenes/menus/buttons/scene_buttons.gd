extends Control

@export var youtube_link := "https://www.youtube.com/rafafiedo"

var main_menu_uid = "uid://c23apbpii8nbk"

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(main_menu_uid)

func _on_youtube_pressed() -> void:
	OS.shell_open(youtube_link)
