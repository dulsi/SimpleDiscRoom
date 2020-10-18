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
	score = 0.00
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
	score += 0.01
	$HUD.update_score(score)


func _on_MobTimer_timeout():
	var disc = Disc.instance()
	$Discs.add_child(disc)
	disc.position = $DiscPosition.position
	disc.screen_size = $Discs.get_parent().get_node("Background").get_rect().size
