@tool
extends Control

func _ready():
	$Version.text = "v" + ProjectSettings.get_setting("application/config/version")
	MusicController.start_music()

func _on_fullscreen_pressed():
	ProjectControls.toggle_fullscreen()

func _on_sound_toggled(toggled_on):
	ProjectControls.set_audio_master(toggled_on)
