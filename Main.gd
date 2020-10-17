extends Node

export (PackedScene) var Disc
var score

func _ready():
	randomize()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game():
	score = 0
	var discAry = $Discs.get_children()
	for item in discAry:
		$Discs.remove_child(item)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_MobTimer_timeout():
	var disc = Disc.instance()
	$Discs.add_child(disc)
	disc.position = $DiscPosition.position
	disc.screen_size = $Discs.get_parent().get_node("Background").get_rect().size
	disc.linear_velocity = Vector2(rand_range(disc.min_speed, disc.max_speed), 0)
	disc.linear_velocity = disc.linear_velocity.rotated(rand_range(0, 2 * PI))
