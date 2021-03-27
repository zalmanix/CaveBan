extends Control

func _ready():
	var settings_file = "user://settings.save"
	var f = File.new()
	var fullPressed
	var borderpressed 
	var vsync
	if f.file_exists(settings_file):
		f.open(settings_file, File.READ)
		fullPressed = f.get_var()
		borderpressed = f.get_var()
		vsync = f.get_var()
		#vsync = f.get_var()
		f.close()
	OS.window_fullscreen = fullPressed
	OS.window_borderless = borderpressed
	OS.vsync_enabled = vsync
	
	if MusicController.get_node("Music").playing:
		pass
	else:
		MusicController.play_music()

func _on_NewGame_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Options/options.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Continue_pressed():
	Pause._on_Load_pressed()

func _on_looserboard_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
