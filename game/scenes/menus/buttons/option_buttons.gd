extends Control


func _on_sound_toggled(toggled_on: bool) -> void:
	MusicController.setup_sound_enable(toggled_on)

func _on_music_toggled(toggled_on: bool) -> void:
	MusicController.setup_music_enable(toggled_on)
