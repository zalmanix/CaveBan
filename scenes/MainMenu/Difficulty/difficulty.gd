extends Control
# This script is 

var rando = GameManager.rando
var rng = RandomNumberGenerator.new()
var number

# Getting random number for later use 
func _ready():
	$Debug.text = str(GameManager.rando)
	rng.randomize()
	number = rng.randi_range(1,20)
	GameManager.single = false
	#$VBoxContainer/MapMaker.text = ""

# Toggle (Random pool button) on/off
func _on_RandomPool_pressed():
	if rando:
		rando = false
	else:
		rando = true

#choosing difficulty and checking if player wants to play only random levels from its pool
func _on_Normal_pressed():
	GameManager.normal = true
	GameManager.hard = false
	GameManager.easy = false
	GameManager.currentlevel = 1
	if rando:
		GameManager.score = 0
		get_tree().change_scene("res://scenes/LevelsDone/normal/Level" +str(number)+ "/LevelBlank.tscn")
		GameManager._ohman()
	else:
		GameManager.single = true
		get_tree().change_scene("res://scenes/LevelsDone/normal/Level1/LevelBlank.tscn")
		GameManager._ohman()

#choosing difficulty and checking if player wants to play only random levels from its pool
func _on_Hard_pressed():
	GameManager.normal = false
	GameManager.hard = true
	GameManager.easy = false
	GameManager.currentlevel = 1
	if rando:
		GameManager.score = 0
		get_tree().change_scene("res://scenes/LevelsDone/hard/Level" +str(number)+ "/LevelHardBlank.tscn")
		GameManager._ohman()
	else:
		GameManager.single = true
		get_tree().change_scene("res://scenes/LevelsDone/hard/Level1/LevelHardBlank.tscn")
		GameManager._ohman()

#choosing difficulty and checking if player wants to play only random levels from its pool
func _on_Easy_pressed():
	#$Debug.text = str(GameManager.rando)
	GameManager.normal = false
	GameManager.hard = false
	GameManager.easy = true
	GameManager.currentlevel = 1
	if rando:
		GameManager.score = 0
		get_tree().change_scene("res://scenes/LevelsDone/easy/Level" + str(number) + "/LevelBlank.tscn")
		GameManager._ohman()
	else:
		GameManager.single = true
		get_tree().change_scene("res://scenes/LevelsDone/easy/Level1/LevelBlank.tscn")
		GameManager._ohman()

# Changing to first easy level and setting Global variable gradually to true so I can use it in
# Levels scripts
func _on_gradual_pressed():
	GameManager.score = 0
	GameManager.normal = false
	GameManager.hard = false
	GameManager.easy = true
	GameManager.gradually = true
	#$Debug.text = str(GameManager.gradually)
	get_tree().change_scene("res://scenes/LevelsDone/easy/Level1/LevelBlank.tscn")
	GameManager._ohman()

# Button go back (changing scene to menu)
func _on_Menu_pressed():
	get_tree().change_scene("res://Main.tscn")

# God forgive me for my sins
func _on_MapMaker_pressed():
	get_tree().change_scene("res://scenes/LevelsCreator/Stage 3/main.tscn")
