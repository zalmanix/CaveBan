extends Node2D

var scoretoget = 10000

var game_end = false
var currentlevel = GameManager.currentlevel
var random = GameManager.rando
onready var children = $boxes.get_children()
var movesleft

func _ready():
	GameManager.canmove = true
	GameManager._ohman()
	movesleft = GameManager.maxmoves

func _process(delta):
	$ui/MovesLeft.text = 'Moves Left: ' + str(GameManager.maxmoves)
	$ui/Score.text = 'Score: ' + str(GameManager.score)
	
	if Pause.loading:
		#setting player
		$Player.position = Vector2(Pause.save_data["Vector2Player"][0], Pause.save_data["Vector2Player"][1]) 
		#setting boxes
		var temp = 0
		for child in children:
			child.position = Vector2(Pause.save_data["Boxes"][temp][0], Pause.save_data["Boxes"][temp][1])
			temp += 1
		Pause.loading = false
	
	if GameManager.fpsdraw:
		$Fps/Label.text = "fps: "+str(Engine.get_frames_per_second())
	else:
		$Fps.visible = false

func check_end():
	Pause.playerpos = $Player.position
	Pause.save_boxes(children)
	
	$ui/AcceptDialog.set_exclusive(true)
	$ui/AcceptDialog.is_exclusive()
	$ui/AcceptDialog2.set_exclusive(true)
	$ui/AcceptDialog2.is_exclusive()
	
	if game_end == false: 
		var spots = $spots.get_child_count()
		for i in $spots.get_children():
			if i.occupied:
				spots -= 1
		
		if spots == 0 and GameManager.maxmoves == 0:
			MusicController.play_win()
			GameManager.canmove = false
			$ui/AcceptDialog.popup()
			game_end = true
		
		
		if spots == 0:
			if game_end:
				pass
			else:
				MusicController.play_win()
				GameManager.canmove = false
				$ui/AcceptDialog.popup()
				game_end = true
		
		if GameManager.maxmoves == 0:
			if game_end:
				pass
			else:
				MusicController.play_game_over()
				GameManager.canmove = false
				$ui/AcceptDialog2.popup()
				game_end = true


func _on_AcceptDialog_confirmed():
	MusicController.cut_win()
	var temp = movesleft - GameManager.maxmoves
	GameManager.score += int(scoretoget / temp)
	GameManager.currentlevel += 1
	
	if GameManager.single == true or GameManager.gradually:
		if GameManager.currentlevel == 21:
		#if GameManager.currentlevel == 3:
			get_tree().change_scene("res://scenes/MainMenu/LooserBoard/looserboard.tscn")
			return
	
	if random:
		_random_scene()
	else:
		_norandom_scene()

func _random_scene():
	var rng = RandomNumberGenerator.new()
	var number
	rng.randomize()
	number = rng.randi_range(1,20)
	get_tree().change_scene("res://scenes/LevelsDone/hard/Level" +str(number)+ "/LevelHardBlank.tscn")

func _norandom_scene():
	get_tree().change_scene("res://scenes/LevelsDone/hard/Level" +str(currentlevel +1)+ "/LevelHardBlank.tscn")

func _on_AcceptDialog2_confirmed():
	MusicController.cut_game_over()
	get_tree().reload_current_scene()
