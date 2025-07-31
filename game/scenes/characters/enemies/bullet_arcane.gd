extends Area2D

var SPEED = 800

var direction := Vector2(-1, 0)

func _physics_process(delta: float) -> void:
	var speed_vec = direction * delta * SPEED
	global_position += speed_vec

func setup_direction(new_direction: Vector2):
	direction = new_direction.normalized()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit()
	queue_free()
