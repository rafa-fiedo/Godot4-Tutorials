extends Node2D

func shoot():
	$AnimationPlayer.play("Shoot")
	$CrossbowArrow.shoot()
