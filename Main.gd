extends Node

export (PackedScene) var Disc
var score
var room_filler = 3
var scoring = false

func _ready():
	randomize()


func _process(delta):
	if scoring:
		score += delta
		$HUD.update_score(score)

func game_over():
	scoring = false
	$StartTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Camera2D.shake = 6
	for i in range(1, 7, 1):
		var bone = preload("res://Bone.tscn").instance()
		$Discs.add_child(bone)
		bone.position = $Player.position
		bone.get_node("Sprite").rotation += rand_range(0, 3.14 * 2)
		bone.linear_velocity = Vector2(rand_range(100, 150), 0)
		bone.linear_velocity = bone.linear_velocity.rotated(rand_range(0, 2 * PI))

func new_game():
	score = 0.00
	scoring = true
	room_filler = 3
	$MobTimer.wait_time = 0.1
	var discAry = $Discs.get_children()
	for item in discAry:
		$Discs.remove_child(item)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_StartTimer_timeout():
	$MobTimer.start()


func _on_MobTimer_timeout():
	var disc = Disc.instance()
	$Discs.add_child(disc)
	disc.position = $DiscPosition.position
	disc.screen_size = $Discs.get_parent().get_node("Background").get_rect().size
	if room_filler > 0:
		room_filler -= 1
		if room_filler == 0:
			$MobTimer.stop()
			$MobTimer.set_wait_time(2)
			$MobTimer.start()
