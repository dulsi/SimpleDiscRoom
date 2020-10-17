extends Node2D

onready var path_follow = get_parent()
var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	get_parent().get_parent().get_parent().get_node("WallDisc").position = path_follow.get_global_position()
	get_parent().get_parent().get_parent().get_node("WallDisc").get_node("CollisionShape2D").position = path_follow.get_global_position()
