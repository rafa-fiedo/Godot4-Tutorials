extends Area2D

signal pressed

func _on_body_entered(_body: Node2D) -> void:
	position.y += 28
	set_deferred("monitoring", false)
	emit_signal("pressed")
