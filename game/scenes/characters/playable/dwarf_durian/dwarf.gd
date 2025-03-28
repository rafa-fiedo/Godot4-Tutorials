extends CharacterBody2D

const SPEED := 300.0
const JUMP_VELOCITY := -660.0
const ROTATION_SPEED := 0.3

var is_look_left := false

func _physics_process(delta: float) -> void:
	calculate_velocity(delta)
	animate()
	
	move_and_slide()

func calculate_velocity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("game_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("game_left", "game_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func animate():
	face_good_direction()
	if velocity.x == 0:
		$AnimationPlayer.play("Idle")
		return
	
	is_look_left = velocity.x < 0

	$AnimationPlayer.play("Running")

func face_good_direction() -> void:
	
	if is_look_left:
		var new_value = ($Sprite2D.scale.x - ROTATION_SPEED)
		new_value = [new_value, -1].max()
		$Sprite2D.scale.x = new_value
		$CollisionShape2D.scale.x = new_value
		$CollisionShape2D.position.x = abs($CollisionShape2D.position.x)
	else:
		var new_value = ($Sprite2D.scale.x + ROTATION_SPEED)
		new_value = [new_value, 1].min()
		$Sprite2D.scale.x = new_value
		$CollisionShape2D.scale.x = new_value
		$CollisionShape2D.position.x = -abs($CollisionShape2D.position.x)

func _on_dead_zone_detector_area_entered(_area: Area2D) -> void:
	call_deferred("reset_scene")
	
func reset_scene():
	get_tree().reload_current_scene()
