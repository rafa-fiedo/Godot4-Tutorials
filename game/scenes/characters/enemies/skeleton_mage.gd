extends CharacterBody2D

enum State {
	IDLE, 
	PATROL, 
	ATTACK,
}

const SPEED := 100
const JUMP_VELOCITY := -660

@export var bullet_scene : PackedScene

var state := State.PATROL
var start_x := 0.0
var walk_range := 300
var direction := Vector2(-1, 0)
var go_left := true
var player_position := Vector2(0,0)

func _ready() -> void:
	start_x = global_position.x

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	
	if $RayCast2D.is_colliding():
		player_position = $RayCast2D.get_collision_point()
		state = State.ATTACK
	
	match state:
		State.IDLE:
			print('idle state')
		State.PATROL:
			patrol_process()
		State.ATTACK:
			$AnimationPlayer.play("Attack")

func patrol_process():
	$AnimationPlayer.play("Run")
	
	var x_distance = global_position.x - start_x
	
	if x_distance > walk_range:
		go_left = true
	elif x_distance < -walk_range:
		go_left = false
	
	velocity.x = SPEED
	if go_left:
		velocity.x = -velocity.x
		
	move_and_slide()
		
func add_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func attack():
	var p_start = $BulletPosition.global_position
	var vec_direction = player_position - p_start
	
	var new_bullet = bullet_scene.instantiate()
	new_bullet.global_position = p_start
	new_bullet.setup_direction(vec_direction)
	
	get_tree().current_scene.add_child(new_bullet)
	
	
func start_attack():
	state = State.ATTACK
	
func start_patrol():
	state = State.PATROL
