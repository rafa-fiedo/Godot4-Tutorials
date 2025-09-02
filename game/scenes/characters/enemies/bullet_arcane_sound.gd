extends AudioStreamPlayer2D

var attack = [
	preload("uid://qixu652m26g0"),
]

var die = [
	preload("uid://boqt7h81ih5ab"),
	preload("uid://c0365fqool3v4"),
	preload("uid://dt8dufrp752ao"),
]

func play_attack():
	stream = attack[0]
	play()

func play_die():
	rand_sound(die)
	
func rand_sound(array):
	var index = randi_range(0, array.size()-1)
	stream = array[index]
	play()
