extends AudioStreamPlayer


var sounds = []

# Called when the node enters the scene tree for the first time.
func _ready():
	sounds.push_back(preload("res://sound/death/1yell2.wav"))
	sounds.push_back(preload("res://sound/death/1yell3.wav"))
	sounds.push_back(preload("res://sound/death/1yell4.wav"))

func random():
	stream = sounds[rand_range(0, sounds.size())]
