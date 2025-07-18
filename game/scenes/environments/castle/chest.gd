extends Area2D

signal open
signal close

var is_player_inside = false

func _unhandled_input(event: InputEvent) -> void:
	if not is_player_inside:
		return
		
	if event.is_action_pressed("game_use"):
		toggle_chest()
	

func _on_body_entered(_body: Node2D) -> void:
	is_player_inside = true

func _on_body_exited(_body: Node2D) -> void:
	is_player_inside = false
	
func toggle_chest():
	if $Sprite2D.frame == 0:
		$Sprite2D.frame = 1
		emit_signal("open")
		
		$AudioStreamPlayer2D.play()
		MusicController.stop_music()
		await get_tree().create_timer(2).timeout
		MusicController.start_music()
		get_tree().reload_current_scene()
	else:
		$Sprite2D.frame = 0
		emit_signal("close")
