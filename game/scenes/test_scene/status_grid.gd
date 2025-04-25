extends GridContainer

func _physics_process(_delta: float) -> void:
	$IsOnFloor.text = str(%Player.is_on_floor())
