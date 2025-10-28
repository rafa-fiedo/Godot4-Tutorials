extends CharacterBody2D

var direction = Vector2(-30, 0)
var is_active = false

func _ready() -> void:
	set_active(false)

func _process(_delta: float) -> void:
	if not is_active:
		return
		
	move_and_collide(direction)

func shoot() -> void:
	set_active(true)
	
func set_active(value: bool) -> void:
	is_active = value
	$DamageArea.set_deferred("monitoring", value)

func _on_damage_area_area_entered(area: Area2D) -> void:
	var player = area.get_parent()
	player.die()
