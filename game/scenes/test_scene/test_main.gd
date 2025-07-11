extends Node2D



func _on_trigger_body_entered(_body: Node2D) -> void:
	$CrossbowTrap.shoot()
	$Trigger.set_deferred("monitorable", false)
	$Trigger.set_deferred("monitoring", false)
