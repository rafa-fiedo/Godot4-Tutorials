extends GridContainer

func _ready() -> void:
	$CoyoteTimerLabel.button_pressed = true
	$InputBufferLabel.button_pressed = true

func _physics_process(_delta: float) -> void:
	$CoyoteTime.text = str(%Player.get_coyote_time())
	$InputBuffer.text = str(%Player.get_input_buffer_time())

func _on_coyote_timer_label_toggled(toggled_on: bool) -> void:
	%Player.toggle_is_coyote_time(toggled_on)

func _on_input_buffer_label_toggled(toggled_on: bool) -> void:
	%Player.toggle_is_input_buffer_time(toggled_on)
