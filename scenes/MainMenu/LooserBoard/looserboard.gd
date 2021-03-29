extends CanvasLayer


func _ready():
	pass

# Button exiting to Menu
func _on_Back_pressed():
	get_tree().change_scene("res://Main.tscn")

# Saving module is made visible 
func _on_SaveScore_pressed():
	$NameDialog.visible = true

# Submiting score
func _on_SubmitScoreButton_pressed():
	var name = $"NameDialog/NameInput".text
	GameManager.set_player_name(name)
	SilentWolf.Scores.persist_score(GameManager.player_name, GameManager.total_score)
	SilentWolf.Scores.get_high_scores()
	$"NameDialog".hide()

# Saving module is made invisible 
func _on_Leave_pressed():
	$NameDialog.visible = false

# Changing scene to difficulty choose scene
func _on_AnotherDifficulty_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")
