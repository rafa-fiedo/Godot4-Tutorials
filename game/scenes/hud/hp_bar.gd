extends CanvasLayer

@export var heart_scene : PackedScene

var max_hp = 5
var current_hp = 3

func _ready() -> void:
	setup_hp()
	
func heal():
	current_hp += 1
	if current_hp >= max_hp:
		current_hp = max_hp
	setup_hp()
	
func hit():
	current_hp -= 1
	if current_hp <= 0:
		current_hp = 0
		get_parent().die()
	setup_hp()
	
func setup_hp():
	for child in $HBoxContainer.get_children():
		child.queue_free()
		
	for x in current_hp:
		add_heart()
	
func add_heart():
	var heart_instance = heart_scene.instantiate()
	$HBoxContainer.add_child(heart_instance)
