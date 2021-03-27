extends Node

var main_music = load("res://assets/audio/main.wav")
var game_over_music = load("res://assets/audio/game_over.wav")
var step_music = load("res://assets/audio/chodv2.wav")
var win_music = load("res://assets/audio/win.wav")

func _ready():
	pass

# Main music
func play_music():
	$Music.stream = main_music
	$Music.play()

func stop_music():
	$Music.stop()

func play_step():
	$Step.stream = step_music
	$Step.play()

# Win music
func play_win():
	$Win.stream = win_music
	$Music.stream_paused = true
	$Win.play()

func _on_Win_finished():
	$Music.stream_paused = false

#Game Over music
func play_game_over():
	$GameOver.stream = game_over_music
	$Music.stream_paused = true
	$GameOver.play()

func _on_GameOver_finished():
	$Music.stream_paused = false
