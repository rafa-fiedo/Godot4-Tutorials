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

func open_chest():
	$Sprite2D.frame = 1
	
func toggle_chest():
	if $Sprite2D.frame == 0:
		$Sprite2D.frame = 1
		emit_signal("open")
	else:
		$Sprite2D.frame = 0
		emit_signal("close")
