extends Camera2D


export var shake = 0
var elapsed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = get_parent().get_node("Player").position
	var disc_pos = get_parent().get_node("DiscPosition").position
	var xOff = (player_pos.x + disc_pos.x * 3) / 4 - 160 - 160
	var yOff = (player_pos.y + disc_pos.y * 3) / 4 - 160 - 20
	var newXOff = offset.x - (offset.x - xOff) * 0.1 + rand_range(-shake, shake)
	var newYOff = offset.y - (offset.y - yOff) * 0.1 + rand_range(-shake, shake)
	offset = Vector2(newXOff, newYOff)
	if shake > 0:
		elapsed += delta
		if elapsed > 0.1:
			shake -= 1
			elapsed = 0
