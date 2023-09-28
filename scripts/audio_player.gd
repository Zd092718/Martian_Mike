extends Node

enum SFX {
	JUMP,
	HURT
}

var sfxs: Dictionary = {
	SFX.HURT: preload("res://assets/audio/hurt.wav"),
	SFX.JUMP: preload("res://assets/audio/jump.wav")
}


func play_sfx(sfx : SFX) -> void:
	var asp := AudioStreamPlayer.new()
	if(sfxs.get(sfx)):
		asp.stream = sfxs.get(sfx)
	else:
		print("Invalid input")
		return
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()
