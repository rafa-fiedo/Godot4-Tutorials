extends AnimationPlayer

var non_stopable = [
	"HeavyAttack",
	]

func play_animation(animation_name:String):
	if current_animation in non_stopable:
		return
	play(animation_name)
