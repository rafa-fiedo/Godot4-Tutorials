extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	position.y += 34
	set_deferred("monitoring", false)
