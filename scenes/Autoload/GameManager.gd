extends Node

var rando = false
var gradually = false
var total_score 
var firstload = false
var canmove = true
var fpsdraw = false
var single = false
var musicdb = -17.0

var score = 0
var currentlevel = 1
var player_name

var easy = false
var normal = false  #zrobić dobrze ;-; bo kacper się popłacze
var hard = false

#func _process(delta):
	#print(OS.get_static_memory_usage())

func go_next_stage_random():
	var rng = RandomNumberGenerator.new()
	var number
	rng.randomize()
	number = rng.randi_range(1,20)
	get_tree().change_scene("res://scenes/LevelsDone/easy/Level" +str(number)+ "/LevelBlank.tscn")

func go_normal_stage_random():
	var rng = RandomNumberGenerator.new()
	var number
	rng.randomize()
	number = rng.randi_range(1,20)
	get_tree().change_scene("res://scenes/LevelsDone/normal/Level" +str(number)+ "/LevelBlank.tscn")


func set_player_name(name):
	player_name = name
	total_score = score



var maxmoves = 999

func _ohman():
	match get_tree().current_scene.name:
		"Level1":
			if easy:
				maxmoves = 24
			elif normal:
				maxmoves = 24
			elif hard:
				maxmoves = 74
		"Level2":
			if easy:
				maxmoves = 47
			elif normal:
				maxmoves = 35
			elif hard:
				maxmoves = 49
		"Level3":
			if easy:
				maxmoves = 33
			elif normal:
				maxmoves = 37
			elif hard:
				maxmoves = 102
		"Level4":
			if easy:
				maxmoves = 25
			elif normal:
				maxmoves = 19
			elif hard:
				maxmoves = 228
		"Level5":
			if easy:
				maxmoves = 29
			elif normal:
				maxmoves = 12
			elif hard:
				maxmoves = 222
		"Level6":
			if easy:
				maxmoves = 36
			elif normal:
				maxmoves = 44
			elif hard:
				maxmoves = 18
		"Level7":
			if easy:
				maxmoves = 27
			elif normal:
				maxmoves = 53
			elif hard:
				maxmoves = 34
		"Level8":
			if easy:
				maxmoves = 20
			elif normal:
				maxmoves = 78
			elif hard:
				maxmoves = 69
		"Level9":
			if easy:
				maxmoves = 37
			elif normal:
				maxmoves = 32
			elif hard:
				maxmoves = 72
		"Level10":
			if easy:
				maxmoves = 30
			elif normal:
				maxmoves = 59
			elif hard:
				maxmoves = 157
		"Level11":
			if easy:
				maxmoves = 30
			elif normal:
				maxmoves = 55
			elif hard:
				maxmoves = 103
		"Level12":
			if easy:
				maxmoves = 17
			elif normal:
				maxmoves = 34
			elif hard:
				maxmoves = 39
		"Level13":
			if easy:
				maxmoves = 41
			elif normal:
				maxmoves = 49
			elif hard:
				maxmoves = 79
		"Level14":
			if easy:
				maxmoves = 20
			elif normal:
				maxmoves = 33
			elif hard:
				maxmoves = 71
		"Level15":
			if easy:
				maxmoves = 28
			elif normal:
				maxmoves = 17
			elif hard:
				maxmoves = 136
		"Level16":
			if easy:
				maxmoves = 24
			elif normal:
				maxmoves = 15
			elif hard:
				maxmoves = 81
		"Level17":
			if easy:
				maxmoves = 27
			elif normal:
				maxmoves = 25
			elif hard:
				maxmoves = 170
		"Level18":
			if easy:
				maxmoves = 27
			elif normal:
				maxmoves = 14
			elif hard:
				maxmoves = 19
		"Level19":
			if easy:
				maxmoves = 26
			elif normal:
				maxmoves = 26
			elif hard:
				maxmoves = 53
		"Level20":
			if easy:
				maxmoves = 40
			elif normal:
				maxmoves = 45
			elif hard:
				maxmoves = 76
		_:
			maxmoves = 99


