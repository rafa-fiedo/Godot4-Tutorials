@tool
extends MarginContainer

@export var margin_horizontal := 50
@export var margin_vertical := 30
@export var title := "How to MAKE godot game?"
@export var tutorial_scene := PackedScene
@export var tutorial_image := Image


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_theme_constant_override("margin_top", margin_vertical)
	add_theme_constant_override("margin_left", margin_horizontal)
	add_theme_constant_override("margin_bottom", margin_vertical)
	add_theme_constant_override("margin_right", margin_horizontal)
	
	%TextureButton.texture_normal = tutorial_image
	%Title.text = title

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file(tutorial_scene.resource_path)
