extends CharacterBody2D

const SPEED := 400.0
const JUMP_VELOCITY := -660.0
const ROTATION_SPEED := 0.3

var is_look_left := false
var is_coyote_timer_on := true
var is_input_buffer_timer_on := true

func _physics_process(delta: float) -> void:
	calculate_velocity(delta)
	animate()
	move_and_slide()

func calculate_velocity(delta: float) -> void:	
	add_gravity(delta)
	jump_logic()
	move_left_right()
	
func add_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func jump_logic():
	if is_on_floor():
		$CoyoteTimer.start()
	
	if Input.is_action_just_pressed("game_jump"):
		$InputBufferTimer.start()
	
	if not $CoyoteTimer.is_stopped() and not $InputBufferTimer.is_stopped():
		make_jump()
		$CoyoteTimer.stop()
		$InputBufferTimer.stop()
	
	if not is_coyote_timer_on:
		$CoyoteTimer.stop()
	
	if not is_input_buffer_timer_on:
		$InputBufferTimer.stop()

func make_jump():
	velocity.y = JUMP_VELOCITY
	$Sound.play_jump()
	
func move_left_right():
	var direction := Input.get_axis("game_left", "game_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func animate():
	if velocity.x < 0:
		is_look_left = true
	elif velocity.x > 0:
		is_look_left = false

	face_good_direction()	
	if not is_on_floor():
		if velocity.y < 0:
			$AnimationPlayer.play("FlyUp")
		else:
			$AnimationPlayer.play("FlyBottom")
		return
	
	if velocity.x == 0:
		$AnimationPlayer.play("Idle")
		return
	
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
	$Sound.play_die()
	
	await get_tree().create_timer(1.5).timeout
	call_deferred("reset_scene")
	
func reset_scene():
	get_tree().reload_current_scene()
	
func get_coyote_time():
	return round(($CoyoteTimer.time_left) * 100) / 100.0
	
func get_input_buffer_time():
	return round(($InputBufferTimer.time_left) * 100) / 100.0

func toggle_is_coyote_time(is_on):
	is_coyote_timer_on = is_on
	
func toggle_is_input_buffer_time(is_on):
	is_input_buffer_timer_on = is_on
