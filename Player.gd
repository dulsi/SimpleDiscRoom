extends Area2D

signal hit

export var speed = 6
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_parent().get_node("Background").get_rect().size
	hide()


func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 400
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 400
	if Input.is_action_pressed("ui_down"):
		velocity.y += 400
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 400
	if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "default"
		$AnimatedSprite.stop()
	position += velocity * delta
	if position.x < 0:
		velocity.x = abs(velocity.x)
	elif position.x > screen_size.x:
		velocity.x = -1 * velocity.x
	if position.y < 0:
		velocity.y = abs(velocity.y)
	elif position.y > screen_size.y:
		velocity.y = -1 * velocity.y
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

