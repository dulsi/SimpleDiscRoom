extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation -= rand_range(0, 2 * 3.14)


func _on_Spark_animation_finished():
	queue_free()
