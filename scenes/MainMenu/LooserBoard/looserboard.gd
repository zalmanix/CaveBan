extends CanvasLayer


func _ready():
	pass


func _on_Back_pressed():
	get_tree().change_scene("res://Main.tscn")



func _on_SaveScore_pressed():
	$NameDialog.visible = true


func _on_SubmitScoreButton_pressed():
	var name = $"NameDialog/NameInput".text
	GameManager.set_player_name(name)
	SilentWolf.Scores.persist_score(GameManager.player_name, GameManager.total_score)
	SilentWolf.Scores.get_high_scores()
	$"NameDialog".hide()


func _on_Leave_pressed():
	$NameDialog.visible = false


func _on_AnotherDifficulty_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")
