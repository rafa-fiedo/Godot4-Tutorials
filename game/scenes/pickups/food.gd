extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.food_pickup()
	queue_free()
