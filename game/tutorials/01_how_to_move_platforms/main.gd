extends Node2D

func _ready() -> void:
	var is_add_velocity = $Player.platform_on_leave == $Player.PLATFORM_ON_LEAVE_ADD_VELOCITY
	%IsAddVelocity.button_pressed = is_add_velocity

func _on_is_add_velocity_toggled(toggled_on: bool) -> void:
	var is_add_velocity
	if toggled_on:
		is_add_velocity = $Player.PLATFORM_ON_LEAVE_ADD_VELOCITY
	else:
		is_add_velocity = $Player.PLATFORM_ON_LEAVE_DO_NOTHING
		
	$Player.platform_on_leave = is_add_velocity
	
