extends Control

# Executed when scene is ready
# Load options from options file and set then
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
		GameManager.musicdb = f.get_var()
		f.close()
	OS.window_fullscreen = fullPressed
	OS.window_borderless = borderpressed
	OS.vsync_enabled = vsync
	var children = MusicController.get_children()
	for i in children:
		i.volume_db = GameManager.musicdb
	
	var save_file = "user://saves/save.dat"
	if File.new().file_exists(save_file):
		$YSort/Menu/CenterRow/Buttons/Continue.disabled = false
	else:
		$YSort/Menu/CenterRow/Buttons/Continue.disabled = true
	
	# Check if music is playing now when it is do nothing
	#If ti is not play it
	if MusicController.get_node("Music").playing:
		pass
	else:
		MusicController.play_music()

# Changing scene
func _on_NewGame_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")

# Changing scene
func _on_Options_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Options/options.tscn")

# Exits game ;-;
func _on_Exit_pressed():
	get_tree().quit()

# Loading Save from file IF it exist
# it is chcecked in Global _on_Load_pressed() function
func _on_Continue_pressed():
	Pause._on_Load_pressed()

# Changind to addon scene where player can wiew looserboard
func _on_Looserboard_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
