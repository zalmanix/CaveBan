extends CanvasLayer

var settings_file = "user://settings.save"


func _ready():
	if File.new().file_exists(settings_file):
		load_settings()
	_on_Apply_pressed()


var fullPressed = false
var borderpressed = false
var vsync = false


func save_settings():
	var f = File.new()
	f.open(settings_file, File.WRITE)
	f.store_var(fullPressed)
	f.store_var(borderpressed)
	f.store_var(vsync)
	#f.store_var(enable_ads)
	f.close()

func load_settings():
	var f = File.new()
	if f.file_exists(settings_file):
		f.open(settings_file, File.READ)
		fullPressed = f.get_var()
		borderpressed = f.get_var()
		vsync = f.get_var()
		#vsync = f.get_var()
		f.close()


func _on_Exit_pressed():
	get_tree().quit()
func _on_ExitMenu_pressed():
	get_tree().change_scene("res://Main.tscn")
	Pause._on_Continue_pressed()


func _on_Fullscreen_toggled(button_pressed):
	if fullPressed:
		fullPressed = false
	else:
		fullPressed = true



func _on_Plus_pressed():
	MusicController.get_node("Music").volume_db += 1
func _on_Minus_pressed():
	MusicController.get_node("Music").volume_db -= 1


func _on_Button_toggled(button_pressed):
	if borderpressed:
		borderpressed = false
	else:
		borderpressed = true


func _on_CheckButton_toggled(button_pressed):
	if vsync:
		vsync = false
	else:
		vsync = true

func _on_FpsCounter_toggled(button_pressed):
	pass # Replace with function body.


func _on_Apply_pressed():
	save_settings()
	OS.window_fullscreen = fullPressed
	OS.window_borderless = borderpressed
	OS.vsync_enabled = vsync
	$Fullscreen.set_pressed(fullPressed)
	$Button.set_pressed(borderpressed)
	$Vsync.set_pressed(vsync)
