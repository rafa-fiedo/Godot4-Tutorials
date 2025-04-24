extends AudioStreamPlayer2D

var die_db = 0
var jump_db = -5

var sounds_die = [
	preload("res://assets/audio/sound/dead_cliff_1.wav"),
	preload("res://assets/audio/sound/dead_cliff_2.wav"),
	preload("res://assets/audio/sound/dead_cliff_2.wav"),
]

var sounds_jump = [
	preload("res://assets/audio/sound/jump_1.wav"),
	preload("res://assets/audio/sound/jump_2.wav"),
	preload("res://assets/audio/sound/jump_3.wav"),
]

func play_die():
	volume_db = die_db
	rand_sound(sounds_die)
	
func play_jump():
	volume_db = jump_db
	rand_sound(sounds_jump)
	
func rand_sound(array):
	var index = randi_range(0, array.size()-1)
	stream = array[index]
	play()
