extends RigidBody2D


export var min_speed = 250  # Minimum speed range.
export var max_speed = 350  # Maximum speed range.
export var screen_size = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#screen_size = get_viewport_rect().size


func _process(delta):
	$AnimatedSprite.rotation -= 3.14 * delta
	if position.x < 0:
		linear_velocity.x = abs(linear_velocity.x)
	elif position.x > screen_size.x && linear_velocity.x > 0:
		linear_velocity.x = -1 * linear_velocity.x
	if position.y < 0:
		linear_velocity.y = abs(linear_velocity.y)
	elif position.y > screen_size.y && linear_velocity.y > 0:
		linear_velocity.y = -1 * linear_velocity.y
	position.x = clamp(position.x, 0, screen_size.x - 1)
	position.y = clamp(position.y, 0, screen_size.y - 1)
