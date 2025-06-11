extends GridContainer

func _physics_process(_delta: float) -> void:
	$IsOnFloor.text = str(%Player.is_on_floor())
	$CoyoteTime.text = str(%Player.get_coyote_time())
	$InputBuffer.text = str(%Player.get_input_buffer_time())
