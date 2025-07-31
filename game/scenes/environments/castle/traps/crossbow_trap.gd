extends Node2D
	
func shoot():
	$AnimationPlayer.play("Shoot")
	$CrossbowArrow.shoot()

func _on_button_pressed() -> void:
	shoot()
