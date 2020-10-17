extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = get_parent().get_node("Player").position
	var disc_pos = get_parent().get_node("DiscPosition").position
	var xOff = (player_pos.x + disc_pos.x * 3) / 4 - 160 - 160
	var yOff = (player_pos.y + disc_pos.y * 3) / 4 - 160 - 20
	var newXOff = offset.x - (offset.x - xOff) * 0.1
	var newYOff = offset.y - (offset.y - yOff) * 0.1
	offset = Vector2(newXOff, newYOff)
