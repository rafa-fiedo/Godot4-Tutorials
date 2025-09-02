extends AudioStreamPlayer2D

var die_db = 0
var jump_db = -5

var sounds_die = [
	preload("uid://cflqh154enbvj"),
	preload("uid://bykvvq1vxsfs7"),
	preload("uid://cbh4tnwot4p6t"),
]

var sounds_jump = [
	preload("uid://bjnbg17o8lbyj"),
	preload("uid://cyndm1ph2m4qq"),
	preload("uid://bwdx30lubnx5h"),
]

var sounds_food_pickup = [
	preload("uid://d08jgsplakrcd")
]

var sounds_hit = [
	preload("uid://bux77ygniq274")
]

func play_die():
	volume_db = die_db
	rand_sound(sounds_die)
	
func play_jump():
	volume_db = jump_db
	rand_sound(sounds_jump)
	
func play_food_pickup():
	stream = sounds_food_pickup[0]
	play()

func play_hit():
	stream = sounds_hit[0]
	play()
	
func rand_sound(array):
	var index = randi_range(0, array.size()-1)
	stream = array[index]
	play()
