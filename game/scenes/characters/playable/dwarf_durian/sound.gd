extends AudioStreamPlayer2D

var die_db = -1
var jump_db = -5
var standard_db = -1

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

var sounds_heavy_attack = [
	preload("uid://dhsp5snkgj458"),
	preload("uid://dytkkokadtlep"),
	preload("uid://q8ic7fmkpljc"),
]

func play_die():
	volume_db = die_db
	rand_sound(sounds_die)
	
func play_jump():
	volume_db = jump_db
	rand_sound(sounds_jump)
	
func play_food_pickup():
	volume_db = standard_db
	stream = sounds_food_pickup[0]
	play()

func play_hit():
	volume_db = standard_db
	stream = sounds_hit[0]
	play()
	
func play_heavy_attack():
	volume_db = standard_db
	rand_sound(sounds_heavy_attack)
	
func rand_sound(array):
	var index = randi_range(0, array.size()-1)
	stream = array[index]
	play()
