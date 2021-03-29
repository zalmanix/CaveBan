extends CanvasLayer

var settings_file = "user://settings.save"



func _ready():
	if File.new().file_exists(settings_file):
		load_settings()
	_on_Apply_pressed()



var fullPressed = false
var borderpressed = false
var vsync = false
var musicdb = GameManager.musicdb


func save_settings():
	var f = File.new()
	f.open(settings_file, File.WRITE)
	f.store_var(fullPressed)
	f.store_var(borderpressed)
	f.store_var(vsync)
	f.store_var(musicdb)
	f.close()

func load_settings():
	var f = File.new()
	if f.file_exists(settings_file):
		f.open(settings_file, File.READ)
		fullPressed = f.get_var()
		borderpressed = f.get_var()
		vsync = f.get_var()
		musicdb = f.get_var()
		f.close()


func _on_Exit_pressed():
	get_tree().quit()
func _on_ExitMenu_pressed():
	get_tree().change_scene("res://Main.tscn")
	Pause._on_Continue_pressed()


func _on_Fullscreen_toggled(button_pressed):
	if button_pressed:
		fullPressed = true
	else:
		fullPressed = false

func _on_Button_toggled(button_pressed):
	if button_pressed:
		borderpressed = true
	else:
		borderpressed = false

func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		vsync = true
	else:
		vsync = false

func _on_FpsCounter_toggled(button_pressed):
	if button_pressed:
		GameManager.fpsdraw = true
	else:
		GameManager.fpsdraw = false


func _on_Apply_pressed():
	save_settings()
	OS.window_fullscreen = fullPressed
	$Fullscreen.set_pressed(fullPressed)
	OS.window_borderless = borderpressed
	$Button.set_pressed(borderpressed)
	OS.vsync_enabled = vsync
	$Vsync.set_pressed(vsync)
	$FpsCounter.set_pressed(GameManager.fpsdraw)
	
	#$AudioSlider.value = int(GameManager.musicdb)

func _on_AudioSlider_value_changed(value):
	musicdb = value
	var children = MusicController.get_children()
	for i in children:
		i.volume_db = value
