extends Node2D

func _on_button_body_entered(_body: Node2D) -> void:
	$CrossbowTrap.shoot()
