extends Area2D

enum State {
	ACTIVE, 
	DIED,
}

var state = State.ACTIVE
var speed = 500

var direction := Vector2(-1, 0)

func _ready() -> void:
	scale.x = 0.01
	scale.y = 0.01
	
	$Sound.play_attack()
	
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.15)
	
func play_die():
	$Sound.play_die()

func _physics_process(delta: float) -> void:
	if state == State.DIED:
		return
		
	var speed_vec = direction * delta * speed
	global_position += speed_vec
	
	speed += (1000 * delta)

func setup_direction(new_direction: Vector2):
	direction = new_direction.normalized()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit()
	
	state = State.DIED
	$AnimationPlayer.play("Die")
