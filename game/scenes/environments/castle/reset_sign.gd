extends Area2D

var body_inside := false

func _unhandled_input(event: InputEvent) -> void:
	if not body_inside:
		return
		
	if event.is_action_pressed("game_use"):
		get_tree().reload_current_scene()

func _on_body_entered(body: Node2D) -> void:
	body_inside = true

func _on_body_exited(body: Node2D) -> void:
	body_inside = false
