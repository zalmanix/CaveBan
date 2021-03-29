extends Node

# loading music from assets/audio folder
var main_music = load("res://assets/audio/main.wav")
var game_over_music = load("res://assets/audio/game_over.wav")
var step_music = load("res://assets/audio/chodv2.wav")
var win_music = load("res://assets/audio/win.wav")

# Main music playing
func play_music():
	$Music.stream = main_music
	$Music.play()

# Main music stopping 
func stop_music():
	$Music.stop()

# Playing Step sfx
func play_step():
	$Step.stream = step_music
	$Step.play()

# Win music playing
# Main music is stopped for a moment
func play_win():
	$Win.stream = win_music
	$Music.stream_paused = true
	$Win.play()

# When Win music is finished then Main mmusic is continued
func _on_Win_finished():
	$Music.stream_paused = false

#Game Over music is playing
# Main music is stopped for a moment
func play_game_over():
	$GameOver.stream = game_over_music
	$Music.stream_paused = true
	$GameOver.play()

# Main music is stopped for a moment
func cut_game_over():
	$GameOver.playing = false
	$Music.stream_paused = false

# Think of it yourself *hmph* **Pouting**
func _on_GameOver_finished():
	
	$Music.stream_paused = false

func cut_win():
	$Win.playing = false
	$Music.stream_paused = false
