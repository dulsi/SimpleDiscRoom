extends AudioStreamPlayer


var sounds = []


func _ready():
	sounds.push_back(preload("res://sound/spawn/pings_scrapes9.wav"))
	sounds.push_back(preload("res://sound/spawn/pings_scrapes11.wav"))
	sounds.push_back(preload("res://sound/spawn/pings_scrapes26.wav"))

func random():
	stream = sounds[rand_range(0, sounds.size())]
