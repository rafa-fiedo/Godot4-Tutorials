extends Node2D

func _on_button_pressed() -> void:
	shoot()
	
func shoot():
	$AnimationPlayer.play("Shoot")
	$CrossbowArrow.shoot()
